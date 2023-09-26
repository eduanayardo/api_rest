<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';
include_once '../class/Items.php';
include_once '../helpers/fechas.php';
include_once '../helpers/textos.php';

$database = new Database();
$db = $database->getConnection();
$municipios = new Municipios($db);

if ($_GET["peticion"] == "municipios") {
    $idEstado = 25;
    $municipios->estado_id = $idEstado;
    $resultado = $municipios->getMunicipiosByIdEstado();
    if($resultado->num_rows > 0) {
        $municipiosResultado["municipios"] = [];
        while ($municipio = $resultado->fetch_assoc()) {
            extract($municipio);
            $municipioDetalle = [
                "id" => $id,
                "nombre" => $nombre,
                "imagen" => $imagen,
                "zona" => $zona,
            ];
            array_push($municipiosResultado["municipios"], $municipioDetalle);
        }
        http_response_code(200);     
        echo json_encode($municipiosResultado);
    } else {     
        http_response_code(404);     
        echo json_encode(
            array("mensaje" => "No se encontraron municipios.")
        );
    }
}

if ($_GET["peticion"] == "municipio") {
    $municipios->id = $_GET['id'];
    $resultado = $municipios->getMunicipioById();
    if($resultado->num_rows > 0) {
        while ($municipio = $resultado->fetch_assoc()) {
            extract($municipio);
            $imagenes = $municipios->getImagenesByMunicipioId();
            $imagenR = (is_null($imagenes)?null:rand(0, count($imagenes)));
            $municipioDetalle = [
                "id" => $id,
                "nombre" => $nombre,
                "titulo" => $titulo,
                "banner" => $banner,
                "imagen" => $imagenes[$imagenR]->url,
                "pm" => "public/assets/Sinaloa/".(strtolower(str_replace(" ", "-", quitar_acentos($nombre))))."/pm.png",
                "superficie" => number_format($superficie, 2, ".", ","),
                "poblacion" => number_format($poblacion, 2, ".", ","),
                "fundacion" => getFechaEscrita($fundacion),
                "pueblo" => $pueblo_magico,
                "descripcion" => $descripcion,
                "gastronomia" => $gastronomia,
                "actividades" => $municipios->getDetalleByMunicipioId(1),
                "imperdibles" => $municipios->getDetalleByMunicipioId(2),
                "imagenes" => $imagenes,
                "pueblos" => $municipios->getPueblosByMunicipioId()
            ];
        }
        http_response_code(200);
        echo json_encode($municipioDetalle);
    } else {     
        http_response_code(404);     
        echo json_encode(
            array("mensaje" => "No se encontro el municipio.")
        );
    } //*/
}