<?php
session_start();
require_once 'conexion.php';
require_once 'cifrado_json.php';

if (isset($_GET['demo'])) {
    $_SESSION['id_usuario'] = 1;
    header("Location: usuario.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $paquete = cifrarDatosJson([
        'correo'   => trim($_POST['email'] ?? ''),
        'password' => $_POST['password'] ?? ''
    ]);
    $cred = descifrarDatosJson($paquete);

    $stmt = $pdo->prepare("SELECT id_usuario, contrasena FROM usuario WHERE correo_electronico = ? AND estado = 'Activo'");
    $stmt->execute([$cred['correo']]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($cred['password'], $user['contrasena'])) {
        $_SESSION['id_usuario'] = (int)$user['id_usuario'];
        header("Location: usuario.php");
        exit();
    } else {
        $error = "Correo o contraseña incorrectos.";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Pecezuelos 2.0</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body class="auth-body">
    <header class="auth-header">
        <a href="index.php" class="logo"><div class="logo-icon">≈</div><span>Pecezuelos 2.0</span></a>
    </header>
    <main class="auth-split">
        <div class="auth-visual-panel">
            <img src="https://images.unsplash.com/photo-1535591273668-578e31182c4f?auto=format&fit=crop&w=1000&q=80" alt="Acuario">
            <div class="auth-visual-overlay"></div>
            <div class="auth-visual-content">
                <span class="eyebrow">Cuidado conectado</span>
                <h2>Tu ecosistema te está esperando.</h2>
                <p>Monitorea, entiende y cuida tu pecera cada día.</p>
            </div>
        </div>
        <div class="auth-form-panel">
            <div class="auth-form-box">
                <span class="eyebrow">Bienvenido de vuelta</span>
                <h1>Inicia sesión</h1>
                <p class="sub">Accede al panel de tu pecera.</p>
                <?php if (!empty($error)): ?><div class="alert-error"><?= htmlspecialchars($error) ?></div><?php endif; ?>
                <form action="login.php" method="POST">
                    <div class="form-group">
                        <label>Correo electrónico</label>
                        <input type="email" name="email" class="form-control" placeholder="nombre@correo.com" required>
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                        <div class="input-wrapper">
                            <input type="password" id="password" name="password" class="form-control" placeholder="Mínimo 6 caracteres" minlength="6" required>
                            <button type="button" class="toggle-pass-btn" onclick="const i=document.getElementById('password');i.type=i.type==='password'?'text':'password'">👁️</button>
                        </div>
                    </div>
                    <div class="form-options">
                        <label class="remember-label"><input type="checkbox"> <span>Recordarme</span></label>
                        <a href="#" class="forgot-link">Olvidé mi contraseña</a>
                    </div>
                    <button type="submit" class="btn-primary btn-full">Entrar a mi pecera →</button>
                </form>
                <div class="auth-switch">¿Aún no tienes cuenta? <a href="registro.php">Regístrate gratis</a></div>
                <a href="login.php?demo=1" class="btn-demo">Acceder como administrador de prueba</a>
            </div>
        </div>
    </main>
    <footer class="auth-footer">
        <a href="index.php" class="logo"><div class="logo-icon small">≈</div><span class="logo-text-small">Pecezuelos 2.0</span></a>
        <div>Tu pecera, siempre en equilibrio.</div>
        <div>© 2025 Pecezuelos 2.0</div>
    </footer>
</body>
</html>
