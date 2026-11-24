<?php
session_start();
require_once 'conexion.php';
require_once 'cifrado_json.php';

if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.php");
    exit();
}

$id_usuario = (int)$_SESSION['id_usuario'];
$mensajeAccion = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['accion_pecera'])) {
    $tipoSensor = ($_POST['accion_pecera'] === 'cambio_agua') ? 'Nivel de agua' : 'Alimento';
    $nuevoValor = ($_POST['accion_pecera'] === 'cambio_agua') ? 95.00 : 100.00;

    $stmtS = $pdo->prepare("
        SELECT s.id_sensor FROM sensor s
        JOIN pecera p ON s.id_pecera = p.id_pecera
        WHERE p.id_usuario = ? AND s.tipo_medicion = ? LIMIT 1
    ");
    $stmtS->execute([$id_usuario, $tipoSensor]);
    $idSensor = $stmtS->fetchColumn();

    if ($idSensor) {
        $call = $pdo->prepare("CALL sp_registrar_medicion(?, ?)");
        $call->execute([$idSensor, $nuevoValor]);
        $call->closeCursor();
    }

    $mensajeAccion = ($tipoSensor === 'Nivel de agua')
        ? "Cambio de agua registrado: nivel restablecido al 95%."
        : "Dispensador activado: depósito de alimento recargado al 100%.";
}

$stmtUser = $pdo->prepare("SELECT nombre_completo FROM usuario WHERE id_usuario = ?");
$stmtUser->execute([$id_usuario]);
$nombreUsuario = $stmtUser->fetchColumn() ?: 'Marina';

$sensores = obtenerYEmularSensores($pdo, $id_usuario, false);
$nombrePecera = $sensores['pecera']['nombre_pecera'];

$stmtEventos = $pdo->prepare("
    SELECT s.tipo_medicion, m.valor_registrado, s.unidad_medida, m.fecha_hora
    FROM medicion m
    JOIN sensor s ON m.id_sensor = s.id_sensor
    JOIN pecera p ON s.id_pecera = p.id_pecera
    WHERE p.id_usuario = ?
    ORDER BY m.id_medicion DESC LIMIT 3
");
$stmtEventos->execute([$id_usuario]);
$eventos = $stmtEventos->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Pecera - Pecezuelos 2.0</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header class="app-navbar">
        <a href="index.php" class="logo"><div class="logo-icon">≈</div><span>Pecezuelos 2.0</span></a>
        <nav class="app-tabs">
            <a href="usuario.php" class="app-tab active">Mi pecera</a>
            <a href="perfil.php" class="app-tab">Mi cuenta</a>
        </nav>
        <div class="app-nav-right">
            <a href="api_sensores.php?cifrado=1" target="_blank" class="icon-square-btn" title="Ver JSON Cifrado">🔒</a>
            <a href="logout.php" class="icon-square-btn" title="Cerrar sesión">↪</a>
        </div>
    </header>

    <main class="dash-container">
        <?php if ($mensajeAccion): ?><div class="alert-success"><?= htmlspecialchars($mensajeAccion) ?></div><?php endif; ?>

        <div class="dash-top-row">
            <div>
                <span class="section-eyebrow">Mi pecera</span>
                <h1>Buenos días, <?= htmlspecialchars($nombreUsuario) ?></h1>
                <p><?= htmlspecialchars($nombrePecera) ?> está estable y saludable.</p>
            </div>
            <a href="perfil.php" class="btn-secondary">⚙️ Configurar pecera</a>
        </div>

        <div class="status-banner">
            <div class="status-banner-left">
                <div class="status-check-circle">✓</div>
                <div>
                    <h3>Todo está en equilibrio</h3>
                    <p>Los sensores reportan condiciones óptimas. Última lectura sincronizada.</p>
                </div>
            </div>
            <div class="status-score"><?= $sensores['equilibrio'] ?><span>/100</span></div>
        </div>

        <div class="sensors-grid">
            <div class="sensor-card">
                <div class="sensor-card-top"><div class="sensor-icon">🌡️</div><span class="pill-optimo">Óptimo</span></div>
                <div class="sensor-label">Temperatura</div>
                <div class="sensor-value"><?= $sensores['temperatura'] ?> <span>°C</span></div>
                <div class="progress-track"><div class="progress-fill" style="width:72%;"></div></div>
                <div class="sensor-hint">Rango ideal: 24–28 °C</div>
            </div>
            <div class="sensor-card">
                <div class="sensor-card-top"><div class="sensor-icon">💧</div><span class="pill-optimo">Óptimo</span></div>
                <div class="sensor-label">Nivel de agua</div>
                <div class="sensor-value"><?= $sensores['nivel_agua'] ?> <span>%</span></div>
                <div class="progress-track"><div class="progress-fill" style="width:<?= $sensores['nivel_agua'] ?>%;"></div></div>
                <div class="sensor-hint">Nivel adecuado</div>
            </div>
            <div class="sensor-card">
                <div class="sensor-card-top"><div class="sensor-icon">👁️</div><span class="pill-optimo">Óptimo</span></div>
                <div class="sensor-label">Turbidez</div>
                <div class="sensor-value"><?= $sensores['turbidez'] ?> <span>NTU</span></div>
                <div class="progress-track"><div class="progress-fill" style="width:35%;"></div></div>
                <div class="sensor-hint">Agua cristalina</div>
            </div>
            <div class="sensor-card">
                <div class="sensor-card-top"><div class="sensor-icon">🥫</div><span class="pill-optimo">Óptimo</span></div>
                <div class="sensor-label">Alimento</div>
                <div class="sensor-value"><?= $sensores['alimento'] ?> <span>%</span></div>
                <div class="progress-track"><div class="progress-fill" style="width:<?= $sensores['alimento'] ?>%;"></div></div>
                <div class="sensor-hint">Suficiente para <?= $sensores['dias_alimento'] ?> días</div>
            </div>
        </div>

        <div class="mid-grid">
            <div class="panel-card">
                <div class="panel-header">
                    <div><span class="section-eyebrow">Últimas 24 horas</span><h3>Temperatura del agua</h3></div>
                    <select class="select-mini"><option>Hoy</option></select>
                </div>
                <svg viewBox="0 0 560 190" width="100%" height="190">
                    <defs>
                        <linearGradient id="tempGrad" x1="0" y1="0" x2="0" y2="1">
                            <stop offset="0%" stop-color="#0e9f91" stop-opacity="0.25"/>
                            <stop offset="100%" stop-color="#0e9f91" stop-opacity="0.0"/>
                        </linearGradient>
                    </defs>
                    <line x1="40" y1="20" x2="540" y2="20" stroke="#edf2f2"/><line x1="40" y1="60" x2="540" y2="60" stroke="#edf2f2"/>
                    <line x1="40" y1="100" x2="540" y2="100" stroke="#edf2f2"/><line x1="40" y1="140" x2="540" y2="140" stroke="#edf2f2"/>
                    <text x="10" y="24" fill="#9aa8aa" font-size="10">28°</text><text x="10" y="64" fill="#9aa8aa" font-size="10">26°</text>
                    <text x="10" y="104" fill="#9aa8aa" font-size="10">24°</text><text x="10" y="144" fill="#9aa8aa" font-size="10">22°</text>
                    <path d="M 45 135 C 95 130, 115 95, 165 105 C 215 115, 240 55, 295 55 C 350 55, 390 105, 445 102 C 490 99, 515 80, 535 65 L 535 155 L 45 155 Z" fill="url(#tempGrad)"/>
                    <path d="M 45 135 C 95 130, 115 95, 165 105 C 215 115, 240 55, 295 55 C 350 55, 390 105, 445 102 C 490 99, 515 80, 535 65" fill="none" stroke="#0e9f91" stroke-width="2.5"/>
                    <text x="45" y="175" fill="#9aa8aa" font-size="10">00:00</text><text x="165" y="175" fill="#9aa8aa" font-size="10">06:00</text>
                    <text x="290" y="175" fill="#9aa8aa" font-size="10">12:00</text><text x="415" y="175" fill="#9aa8aa" font-size="10">18:00</text>
                    <text x="512" y="175" fill="#9aa8aa" font-size="10">Ahora</text>
                </svg>
            </div>

            <div class="panel-card">
                <div class="panel-header"><div><span class="section-eyebrow">Control remoto</span><h3>Acciones rápidas</h3></div></div>
                <form method="POST" action="usuario.php">
                    <button type="submit" name="accion_pecera" value="cambio_agua" class="action-btn-card">
                        <div class="action-left"><div class="action-icon-blue">💧</div><div><h4>Iniciar cambio de agua</h4><p>Último: hace 6 días</p></div></div>
                        <span>→</span>
                    </button>
                    <button type="submit" name="accion_pecera" value="dispensar" class="action-btn-card">
                        <div class="action-left"><div class="action-icon-amber">🥫</div><div><h4>Dispensar alimento</h4><p>Próxima dosis: 18:00</p></div></div>
                        <span>→</span>
                    </button>
                </form>
            </div>
        </div>

        <div class="panel-card">
            <div class="panel-header">
                <div><span class="section-eyebrow">Actividad</span><h3>Eventos recientes</h3></div>
                <a href="api_sensores.php" target="_blank" class="forgot-link">Ver JSON en vivo</a>
            </div>
            <div class="event-list">
                <?php foreach ($eventos as $ev): ?>
                    <div class="event-item">
                        <div class="event-left">
                            <span class="event-dot dot-teal"></span>
                            <div>
                                <h4>Lectura de <?= htmlspecialchars($ev['tipo_medicion']) ?> registrada</h4>
                                <p>Valor reportado: <?= htmlspecialchars($ev['valor_registrado']) ?> <?= htmlspecialchars($ev['unidad_medida']) ?></p>
                            </div>
                        </div>
                        <span class="event-time"><?= htmlspecialchars($ev['fecha_hora']) ?></span>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>

    <script>
        setInterval(async () => {
            const res = await fetch('api_sensores.php');
            const data = await res.json();
            if (data.status === 'ok') {
                const v = document.querySelectorAll('.sensor-value');
                v[0].innerHTML = `${data.sensores.temperatura} <span>°C</span>`;
                v[1].innerHTML = `${data.sensores.nivel_agua} <span>%</span>`;
                v[2].innerHTML = `${data.sensores.turbidez} <span>NTU</span>`;
                v[3].innerHTML = `${data.sensores.alimento} <span>%</span>`;
            }
        }, 10000);
    </script>
</body>
</html>
