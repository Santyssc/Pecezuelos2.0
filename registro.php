<?php
session_start();
require_once 'conexion.php';
require_once 'cifrado_json.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $paquete = cifrarDatosJson([
        'nombre'        => trim($_POST['nombre'] ?? ''),
        'nombre_pecera' => trim($_POST['nombre_pecera'] ?? ''),
        'correo'        => trim($_POST['email'] ?? ''),
        'password'      => $_POST['password'] ?? '',
        'capacidad'     => (float)($_POST['capacidad'] ?? 50.00)
    ]);
    $datos = descifrarDatosJson($paquete);

    if (!empty($datos['nombre']) && !empty($datos['nombre_pecera']) && !empty($datos['correo']) && strlen($datos['password']) >= 6) {
        try {
            $pdo->beginTransaction();

            $check = $pdo->prepare("SELECT id_usuario FROM usuario WHERE correo_electronico = ?");
            $check->execute([$datos['correo']]);
            if ($check->fetch()) throw new Exception("Ese correo electrónico ya está registrado.");

            $hash = password_hash($datos['password'], PASSWORD_DEFAULT);
            $stmtUser = $pdo->prepare("CALL sp_insertar_usuario(2, ?, ?, ?)");
            $stmtUser->execute([$datos['nombre'], $datos['correo'], $hash]);
            $stmtUser->closeCursor();

            $stmtId = $pdo->prepare("SELECT id_usuario FROM usuario WHERE correo_electronico = ?");
            $stmtId->execute([$datos['correo']]);
            $idUsuario = (int)$stmtId->fetchColumn();

            $stmtPec = $pdo->prepare("INSERT INTO pecera (id_usuario, nombre_pecera, capacidad_litros) VALUES (?, ?, ?)");
            $stmtPec->execute([$idUsuario, $datos['nombre_pecera'], $datos['capacidad']]);
            $idPecera = (int)$pdo->lastInsertId();

            $sensoresBase = [
                ['Temperatura', '°C', 26.40],
                ['Nivel de agua', '%', 84.00],
                ['Turbidez', 'NTU', 1.80],
                ['Alimento', '%', 72.00]
            ];

            $stmtSen = $pdo->prepare("INSERT INTO sensor (id_pecera, tipo_medicion, unidad_medida) VALUES (?, ?, ?)");
            $stmtMed = $pdo->prepare("CALL sp_registrar_medicion(?, ?)");

            foreach ($sensoresBase as $sb) {
                $stmtSen->execute([$idPecera, $sb[0], $sb[1]]);
                $idSensor = (int)$pdo->lastInsertId();
                $stmtMed->execute([$idSensor, $sb[2]]);
                $stmtMed->closeCursor();
            }

            $pdo->commit();
            $_SESSION['id_usuario'] = $idUsuario;
            header("Location: usuario.php");
            exit();
        } catch (Exception $e) {
            if ($pdo->inTransaction()) $pdo->rollBack();
            $error = $e->getMessage();
        }
    } else {
        $error = "Completa todos los campos correctamente (contraseña mínimo 6 caracteres).";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crea tu cuenta - Pecezuelos 2.0</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body class="auth-body">
    <header class="auth-header">
        <a href="index.php" class="logo"><div class="logo-icon">≈</div><span>Pecezuelos 2.0</span></a>
    </header>
    <main class="auth-split">
        <div class="auth-visual-panel">
            <a href="index.php" class="btn-back-overlay">← Volver al inicio</a>
            <img src="https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?auto=format&fit=crop&w=1000&q=80" alt="Acuario">
            <div class="auth-visual-overlay"></div>
            <div class="auth-visual-content">
                <span class="eyebrow">Cuidado conectado</span>
                <h2>Un mejor hogar para tus peces comienza aquí.</h2>
                <p>Monitorea, entiende y cuida tu pecera cada día.</p>
            </div>
        </div>
        <div class="auth-form-panel">
            <div class="auth-form-box wide">
                <span class="eyebrow">Únete a Pecezuelos 2.0</span>
                <h1>Crea tu cuenta</h1>
                <p class="sub">Configura tu primera pecera en pocos pasos.</p>
                <?php if (!empty($error)): ?><div class="alert-error"><?= htmlspecialchars($error) ?></div><?php endif; ?>
                <form action="registro.php" method="POST">
                    <div class="form-row-2">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="nombre" class="form-control" placeholder="Tu nombre" required>
                        </div>
                        <div class="form-group">
                            <label>Nombre de la pecera</label>
                            <input type="text" name="nombre_pecera" class="form-control" placeholder="Ej. Arrecife Azul" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Correo electrónico</label>
                        <input type="email" name="email" class="form-control" placeholder="nombre@correo.com" required>
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                        <input type="password" name="password" class="form-control" placeholder="Mínimo 6 caracteres" minlength="6" required>
                    </div>
                    <div class="form-group">
                        <label>Capacidad de tu pecera</label>
                        <select name="capacidad" class="form-control" required>
                            <option value="" disabled selected>Selecciona una capacidad</option>
                            <option value="20">Pequeña (20 Litros)</option>
                            <option value="50">Mediana (50 Litros)</option>
                            <option value="100">Grande (100 Litros)</option>
                            <option value="200">Extra grande (200 Litros)</option>
                        </select>
                    </div>
                    <div class="terms-group">
                        <label><input type="checkbox" required> <span>Acepto los términos y la política de privacidad</span></label>
                    </div>
                    <button type="submit" class="btn-primary btn-full">Crear mi cuenta →</button>
                </form>
                <div class="auth-switch">¿Ya tienes una cuenta? <a href="login.php">Inicia sesión</a></div>
            </div>
        </div>
    </main>
</body>
</html>
