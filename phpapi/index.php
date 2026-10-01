<?php

header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$rawBody = file_get_contents('php://input');

$body = json_decode($rawBody, true);

if ($method === 'GET' && $uri === '/health-check') {

    http_response_code(200);

    echo json_encode([
        'success' => true,
        'data' => [
            'language' => 'php'
        ],
        'message' => 'API online'
    ]);

}else if ($method === 'GET' && $uri === '/health-check') {

    http_response_code(200);

    echo json_encode([
        'success' => true,
        'data' => [
            'language' => 'php'
        ],
        'message' => 'API online'
    ]);

}else {

    http_response_code(404);

    echo json_encode([
        'success' => false,
        'data' => null,
        'message' => 'Not Found'
    ]);
}
$DB_Connector = new PDO(
    'mysql:host=192.168.56.1;port=3306;dbname=Tienda_Sneakers',
    'User_vb',
    'User_S1'
);

$DB_Connector->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$DB_Connector->exec("SET CHARACTER SET utf8");

$SQL_Query = "SELECT * FROM Brand";

$SQL_Sentence = $DB_Connector->prepare($SQL_Query);

$SQL_Sentence->execute();

$Data = $SQL_Sentence->fetch(PDO::FETCH_ASSOC);