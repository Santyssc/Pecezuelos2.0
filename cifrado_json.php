<?php
define('PECEZUELOS_SECRET_KEY', hash('sha256', 'Pecezuelos2026_ClaveSecreta_EC2', true));

function cifrarDatosJson(array $datos): string {
    $jsonPlano = json_encode($datos, JSON_UNESCAPED_UNICODE);
    $ivLength  = openssl_cipher_iv_length('aes-256-cbc');
    $iv        = openssl_random_pseudo_bytes($ivLength);
    $cifrado   = openssl_encrypt($jsonPlano, 'aes-256-cbc', PECEZUELOS_SECRET_KEY, OPENSSL_RAW_DATA, $iv);

    return json_encode([
        'iv'      => base64_encode($iv),
        'payload' => base64_encode($cifrado),
        'alg'     => 'AES-256-CBC'
    ]);
}

function descifrarDatosJson(string $paqueteJson): ?array {
    $envoltura = json_decode($paqueteJson, true);
    if (!isset($envoltura['iv'], $envoltura['payload'])) return null;

    $iv        = base64_decode($envoltura['iv']);
    $cifrado   = base64_decode($envoltura['payload']);
    $jsonPlano = openssl_decrypt($cifrado, 'aes-256-cbc', PECEZUELOS_SECRET_KEY, OPENSSL_RAW_DATA, $iv);

    return ($jsonPlano === false) ? null : json_decode($jsonPlano, true);
}
?>
