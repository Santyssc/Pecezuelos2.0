<?php
session_start();
header('Content-Type: application/json; charset=utf-8');
require_once 'conexion.php';
require_once 'cifrado_json.php';

$id_usuario = (int)($_SESSION['id_usuario'] ?? 1);
$datos = obtenerYEmularSensores($pdo, $id_usuario, true);

$respuesta = [
    'status'     => 'ok',
    'timestamp'  => date('Y-m-d H:i:s'),
    'id_usuario' => $id_usuario,
    'sensores'   => $datos
];

if (isset($_GET['cifrado']) && $_GET['cifrado'] == '1') {
    echo cifrarDatosJson($respuesta);
} else {
    echo json_encode($respuesta, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
}
?>
