<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pecezuelos 2.0 - El bienestar de tu pecera, en tus manos</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header>
        <div class="container navbar">
            <a href="index.php" class="logo"><div class="logo-icon">≈</div><span>Pecezuelos 2.0</span></a>
            <nav class="nav-links">
                <a href="#funciones">Funciones</a>
                <a href="#cuidado">Cuidado</a>
            </nav>
            <div class="nav-actions">
                <a href="login.php" class="link-login">Iniciar sesión</a>
                <a href="registro.php" class="btn-primary">Crear cuenta</a>
            </div>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <div class="hero-grid">
                <div>
                    <div class="badge-eyebrow"><span class="badge-dot"></span> Monitoreo inteligente en tiempo real</div>
                    <h1>El bienestar de tu pecera, <span>en tus manos.</span></h1>
                    <p class="subtitle">Controla la calidad del agua, automatiza cuidados y recibe alertas antes de que algo cambie. Todo desde un solo lugar.</p>
                    <div class="hero-cta-group">
                        <a href="registro.php" class="btn-primary">Comenzar ahora →</a>
                        <a href="login.php" class="btn-secondary">Ya tengo cuenta</a>
                    </div>
                    <div class="hero-checks">
                        <span>✓ Instalación simple</span>
                        <span>✓ Alertas 24/7</span>
                        <span>✓ Datos seguros</span>
                    </div>
                </div>
                <div class="hero-visual">
                    <div class="hero-image-frame">
                        <img src="https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?auto=format&fit=crop&w=900&q=80" alt="Acuario">
                    </div>
                    <div class="float-card-temp">
                        <div class="label">Temperatura</div>
                        <div class="value">26.4 °C</div>
                        <div class="status">Óptima</div>
                    </div>
                    <div class="float-card-health">
                        <div class="health-badge-icon">≈</div>
                        <div><h4>Agua saludable</h4><p>Todos los parámetros estables</p></div>
                    </div>
                </div>
            </div>

            <div class="stats-wrapper">
                <div class="stats-bar">
                    <div class="stat-item"><div class="num">3</div><div class="desc">sensores conectados</div></div>
                    <div class="stat-item"><div class="num">24/7</div><div class="desc">monitoreo continuo</div></div>
                    <div class="stat-item"><div class="num">2 min</div><div class="desc">para configurar</div></div>
                    <div class="stat-item"><div class="num">100%</div><div class="desc">control desde tu móvil</div></div>
                </div>
            </div>
        </div>
    </section>

    <section id="funciones" class="features-section">
        <div class="container">
            <div class="section-header">
                <span class="section-eyebrow">Todo bajo control</span>
                <h2>Cuida mejor, preocúpate menos</h2>
                <p>Información clara y acciones simples para mantener un ecosistema saludable.</p>
            </div>
            <div class="features-grid">
                <div class="feature-card featured">
                    <div class="feature-icon-box">🌡️</div>
                    <div class="feature-bars-deco"><span></span><span></span><span></span><span></span><span></span><span></span></div>
                    <span class="feature-tag">Monitoreo</span>
                    <h3>Condiciones en tiempo real</h3>
                    <p>Temperatura, turbidez y nivel de agua actualizados constantemente.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-box">⚠️</div>
                    <span class="feature-tag">Prevención</span>
                    <h3>Alertas que llegan a tiempo</h3>
                    <p>Recibe avisos inmediatos cuando un parámetro sale del rango seguro.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-box">💧</div>
                    <span class="feature-tag">Registro</span>
                    <h3>Historial de cuidados</h3>
                    <p>Consulta cambios de agua, lecturas y tendencias en un calendario sencillo.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="cuidado" class="care-section">
        <div class="container">
            <div class="care-grid">
                <div class="care-image-frame">
                    <img src="https://images.unsplash.com/photo-1535591273668-578e31182c4f?auto=format&fit=crop&w=900&q=80" alt="Pez">
                </div>
                <div class="care-content">
                    <span class="section-eyebrow">Un hábitat sano</span>
                    <h2>Rutinas simples. Peces más felices.</h2>
                    <p>Pecezuelos 2.0 convierte datos complejos en recomendaciones fáciles de seguir.</p>
                    <div class="step-row"><span class="step-num">01</span><div class="step-text"><h4>Conecta tus sensores</h4><p>Vincúlalos en menos de dos minutos.</p></div></div>
                    <div class="step-row"><span class="step-num">02</span><div class="step-text"><h4>Define rangos seguros</h4><p>Personaliza las condiciones de tu especie.</p></div></div>
                    <div class="step-row"><span class="step-num">03</span><div class="step-text"><h4>Actúa cuando importa</h4><p>Recibe alertas y controla tus dispositivos.</p></div></div>
                </div>
            </div>
        </div>
    </section>

    <section class="cta-section">
        <div class="container">
            <div class="cta-banner">
                <span class="section-eyebrow">Empieza hoy</span>
                <h2>Tu pecera merece el mejor cuidado</h2>
                <p>Crea tu cuenta gratis y descubre una forma más tranquila de cuidar la vida acuática.</p>
                <a href="registro.php" class="btn-white-cta">Crear mi pecera →</a>
            </div>
        </div>
    </section>

    <footer>
        <div class="container footer-inner">
            <div class="logo"><div class="logo-icon small">≈</div><span class="logo-text-small">Pecezuelos 2.0</span></div>
            <div>Tu pecera, siempre en equilibrio.</div>
            <div>© 2025 Pecezuelos 2.0</div>
        </div>
    </footer>
</body>
</html>
