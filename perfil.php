<?php
session_start();
require_once 'conexion.php';

if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.php");
    exit();
}

$id_usuario = (int)$_SESSION['id_usuario'];
$mensaje = '';
$error   = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['accion'] ?? '') === 'perfil') {
    $nombre = trim($_POST['nombre'] ?? '');
    $correo = trim($_POST['email'] ?? '');
    $pecera = trim($_POST['nombre_pecera'] ?? '');
    $idRol  = (int)($_POST['id_rol'] ?? 2);

    if (!empty($nombre) && !empty($correo) && !empty($pecera)) {
        $call = $pdo->prepare("CALL sp_actualizar_usuario(?, ?, ?, ?, 'Activo')");
        $call->execute([$id_usuario, $idRol, $nombre, $correo]);
        $call->closeCursor();

        $pdo->prepare("UPDATE pecera SET nombre_pecera = ? WHERE id_usuario = ?")->execute([$pecera, $id_usuario]);
        $mensaje = "Información actualizada correctamente.";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['accion'] ?? '') === 'password') {
    $nueva = $_POST['nueva_password'] ?? '';
    $conf  = $_POST['confirmar_password'] ?? '';
    if (strlen($nueva) >= 8 && $nueva === $conf) {
        $hash = password_hash($nueva, PASSWORD_DEFAULT);
        $pdo->prepare("UPDATE usuario SET contrasena = ? WHERE id_usuario = ?")->execute([$hash, $id_usuario]);
        $mensaje = "Contraseña actualizada.";
    } else {
        $error = "La contraseña debe tener mínimo 8 caracteres y coincidir.";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['accion'] ?? '') === 'eliminar') {
    $callDel = $pdo->prepare("CALL sp_eliminar_usuario(?)");
    $callDel->execute([$id_usuario]);
    $callDel->closeCursor();
    session_destroy();
    header("Location: index.php");
    exit();
}

$stmt = $pdo->prepare("
    SELECT u.id_rol, u.nombre_completo, u.correo_electronico, r.nombre_rol, p.nombre_pecera
    FROM usuario u
    JOIN rol r ON u.id_rol = r.id_rol
    LEFT JOIN pecera p ON u.id_usuario = p.id_usuario
    WHERE u.id_usuario = ? LIMIT 1
");
$stmt->execute([$id_usuario]);
$datos = $stmt->fetch(PDO::FETCH_ASSOC);

$nombre    = $datos['nombre_completo'] ?? 'Marina López';
$email     = $datos['correo_electronico'] ?? 'marina@email.com';
$rolNombre = $datos['nombre_rol'] ?? 'Usuario';
$pecera    = $datos['nombre_pecera'] ?? 'Arrecife Azul';
$iniciales = strtoupper(substr($nombre, 0, 2));
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuración de Cuenta - Pecezuelos 2.0</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header class="app-navbar">
        <a href="index.php" class="logo"><div class="logo-icon">≈</div><span>Pecezuelos 2.0</span></a>
        <nav class="app-tabs">
            <a href="usuario.php" class="app-tab">Mi pecera</a>
            <a href="perfil.php" class="app-tab active">Mi cuenta</a>
        </nav>
        <div class="app-nav-right">
            <a href="logout.php" class="icon-square-btn" title="Cerrar sesión">↪</a>
        </div>
    </header>

    <main class="dash-container">
        <div class="dash-top-row">
            <div>
                <span class="section-eyebrow">Mi espacio</span>
                <h1>Configuración de cuenta</h1>
                <p>Actualiza tus datos personales y opciones de seguridad.</p>
            </div>
        </div>

        <?php if ($mensaje): ?><div class="alert-success"><?= htmlspecialchars($mensaje) ?></div><?php endif; ?>
        <?php if ($error): ?><div class="alert-error"><?= htmlspecialchars($error) ?></div><?php endif; ?>

        <div class="profile-grid">
            <aside class="profile-sidebar-card">
                <div class="avatar-circle"><?= htmlspecialchars($iniciales) ?></div>
                <h3><?= htmlspecialchars($nombre) ?></h3>
                <div class="email-txt"><?= htmlspecialchars($email) ?></div>
                <div class="role-pill"><?= htmlspecialchars($rolNombre) ?> Pecezuelos 2.0</div>
                <a href="logout.php" class="logout-link">Cerrar sesión</a>
            </aside>

            <div class="profile-forms-col">
                <div class="panel-card">
                    <div class="card-form-header">
                        <h3>Información personal</h3>
                        <p>Cambia tu nombre de usuario y correo.</p>
                    </div>
                    <form method="POST" action="perfil.php">
                        <input type="hidden" name="accion" value="perfil">
                        <input type="hidden" name="id_rol" value="<?= (int)($datos['id_rol'] ?? 2) ?>">
                        <div class="form-row-2">
                            <div class="form-group">
                                <label>Nombre de usuario</label>
                                <input type="text" name="nombre" class="form-control" value="<?= htmlspecialchars($nombre) ?>" required>
                            </div>
                            <div class="form-group">
                                <label>Correo electrónico</label>
                                <input type="email" name="email" class="form-control" value="<?= htmlspecialchars($email) ?>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nombre de la pecera</label>
                            <input type="text" name="nombre_pecera" class="form-control" value="<?= htmlspecialchars($pecera) ?>" required>
                        </div>
                        <div class="card-form-footer">
                            <button type="submit" class="btn-primary">Guardar cambios</button>
                        </div>
                    </form>
                </div>

                <div class="panel-card">
                    <div class="card-form-header">
                        <h3>Seguridad</h3>
                        <p>Usa una contraseña segura que no utilices en otros sitios.</p>
                    </div>
                    <form method="POST" action="perfil.php">
                        <input type="hidden" name="accion" value="password">
                        <div class="form-group">
                            <label>Contraseña actual</label>
                            <input type="password" class="form-control" placeholder="••••••••">
                        </div>
                        <div class="form-row-2">
                            <div class="form-group">
                                <label>Nueva contraseña</label>
                                <input type="password" name="nueva_password" class="form-control" placeholder="Mínimo 8 caracteres" required>
                            </div>
                            <div class="form-group">
                                <label>Confirmar contraseña</label>
                                <input type="password" name="confirmar_password" class="form-control" placeholder="Repite la contraseña" required>
                            </div>
                        </div>
                        <div class="card-form-footer">
                            <button type="submit" class="btn-secondary">Actualizar contraseña</button>
                        </div>
                    </form>
                </div>

                <div class="danger-zone-card">
                    <div>
                        <h4>Eliminar cuenta</h4>
                        <p>Esta acción es permanente y eliminará todos tus datos y el historial de tu pecera.</p>
                    </div>
                    <form method="POST" action="perfil.php" onsubmit="return confirm('¿Seguro que deseas eliminar tu cuenta permanentemente?');">
                        <input type="hidden" name="accion" value="eliminar">
                        <button type="submit" class="btn-danger-outline">Eliminar mi cuenta</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
