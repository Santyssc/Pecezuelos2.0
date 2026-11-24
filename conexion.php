<?php
$host = 'localhost';
$dbname = 'pecezuelos_db';
$username = 'app_agenda';
$password = 'PasswordSegura2026*';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error de conexión a pecezuelos_db: " . $e->getMessage());
}

function obtenerYEmularSensores(PDO $pdo, int $id_usuario, bool $insertarNueva = false): array {
    $stmtPec = $pdo->prepare("SELECT id_pecera, nombre_pecera, capacidad_litros FROM pecera WHERE id_usuario = ? LIMIT 1");
    $stmtPec->execute([$id_usuario]);
    $pecera = $stmtPec->fetch(PDO::FETCH_ASSOC);

    if (!$pecera) {
        return [
            'pecera' => ['id_pecera' => 0, 'nombre_pecera' => 'Sin pecera', 'capacidad_litros' => 50],
            'temperatura' => 26.0, 'nivel_agua' => 80, 'turbidez' => 1.5, 'alimento' => 70,
            'dias_alimento' => 7, 'equilibrio' => 95
        ];
    }

    $stmtSen = $pdo->prepare("SELECT id_sensor, tipo_medicion FROM sensor WHERE id_pecera = ?");
    $stmtSen->execute([$pecera['id_pecera']]);
    $sensores = $stmtSen->fetchAll(PDO::FETCH_ASSOC);

    $lecturas = [
        'Temperatura'   => 26.4,
        'Nivel de agua' => 84.0,
        'Turbidez'      => 1.8,
        'Alimento'      => 72.0
    ];

    foreach ($sensores as $s) {
        $idSensor = (int)$s['id_sensor'];
        $tipo     = $s['tipo_medicion'];

        $stmtMed = $pdo->prepare("SELECT valor_registrado FROM medicion WHERE id_sensor = ? ORDER BY id_medicion DESC LIMIT 1");
        $stmtMed->execute([$idSensor]);
        $ultimoValor = $stmtMed->fetchColumn();

        if ($insertarNueva || $ultimoValor === false) {
            $base = ($ultimoValor !== false) ? (float)$ultimoValor : ($lecturas[$tipo] ?? 25.0);
            $delta = (mt_rand(-3, 3) / 10);

            if ($tipo === 'Temperatura') {
                $nuevo = round(min(27.8, max(24.2, $base + $delta)), 1);
            } elseif ($tipo === 'Nivel de agua') {
                $nuevo = round(min(96, max(72, $base + round($delta * 2))), 0);
            } elseif ($tipo === 'Turbidez') {
                $nuevo = round(min(2.6, max(0.8, $base + ($delta / 2))), 1);
            } else {
                $nuevo = round(min(98, max(25, $base)), 0);
            }

            $call = $pdo->prepare("CALL sp_registrar_medicion(?, ?)");
            $call->execute([$idSensor, $nuevo]);
            $call->closeCursor();
            $lecturas[$tipo] = $nuevo;
        } else {
            $lecturas[$tipo] = (float)$ultimoValor;
        }
    }

    $alimento = (int)$lecturas['Alimento'];
    return [
        'pecera'        => $pecera,
        'temperatura'   => number_format($lecturas['Temperatura'], 1),
        'nivel_agua'    => (int)$lecturas['Nivel de agua'],
        'turbidez'      => number_format($lecturas['Turbidez'], 1),
        'alimento'      => $alimento,
        'dias_alimento' => max(1, (int)round($alimento / 9)),
        'equilibrio'    => 96
    ];
}
?>
