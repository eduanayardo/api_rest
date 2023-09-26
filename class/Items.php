<?php

class Municipios {
	private $table  = "municipio";
    public $id;
    public $nombre;
    public $titulo;
    public $superficie;
    public $poblacion;
    public $fundacion;
    public $pueblo_magico;
    public $descripcion;
    public $gastronomia;
    public $imagen;
    public $status;
    public $estado_id;
    public $zona_id;
    public $created; 
	public $modified; 

	// Variables detalles
	public $tipo_actividad;

    private $conn;
	
    public function __construct($db){
        $this->conn = $db;
    }	
	
	function getMunicipiosByIdEstado()
	{
		$stmt = $this->conn->prepare("SELECT municipio.id, municipio.nombre, imagen, zona.nombre zona FROM ".$this->table." JOIN zona ON municipio.zona_id = zona.id WHERE estado_id = ?");
		$stmt->bind_param("i", $this->estado_id);
		$stmt->execute();			
		$resultado = $stmt->get_result();		
		return $resultado;	
	}

	function getMunicipioById()
	{
		$stmt = $this->conn->prepare("SELECT * FROM ".$this->table." WHERE id = ? AND municipio.status = 1 ;");
		$stmt->bind_param("i", $this->id);
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado;
	}

	function getDetalleByMunicipioId($tipoActividad)
	{
		$stmt = $this->conn->prepare("SELECT * FROM detalle WHERE municipio_id = ? AND tipo_actividad_id = ?;");
		$stmt->bind_param("ii", $this->id, $tipoActividad);
		$stmt->execute();
		$resultado = $stmt->get_result();
		if($resultado->num_rows > 0) {
			$detalle = "";
			while ($municipio = $resultado->fetch_assoc()) {
				extract($municipio);
				$detalle = json_decode($informacion);
			}
		}
		return $detalle->actividades;
	}

	function getImagenesByMunicipioId()
	{
		$stmt = $this->conn->prepare("SELECT * FROM galeria WHERE municipio_id = ? AND status = 1;");
		$stmt->bind_param("i", $this->id);
		$stmt->execute();
		$resultado = $stmt->get_result();
		if($resultado->num_rows > 0) {
			$imagenes = [];
			while ($imagen = $resultado->fetch_assoc()) {
				extract($imagen);
				$image = (object)[
					"descripcion" => $descripcion,
					"url" => $url
				];
				array_push($imagenes, $image);
			}
		}
		return $imagenes;
	}

	function getPueblosByMunicipioId()
	{
		$stmt = $this->conn->prepare("SELECT * FROM pueblo WHERE municipio_id = ? AND status = 1;");
		$stmt->bind_param("i", $this->id);
		$stmt->execute();
		$resultado = $stmt->get_result();
		if($resultado->num_rows > 0) {
			$pueblos = [];
			while ($pueblo = $resultado->fetch_assoc()) {
				extract($pueblo);
				$informacion = json_decode($informacion);
				$pue = (object)[
					"nombre" => $nombre,
					"titulo" => $informacion->titulo,
					"descripcion" => $informacion->descripcion,
					"url" => $img
				];
				array_push($pueblos, $pue);
			}
		}
		return $pueblos;
	}
	
	/*
	function create()
	{
		$stmt = $this->conn->prepare("INSERT INTO ".$this->table."(`name`, `description`, `price`, `category_id`, `created`) VALUES(?,?,?,?,?)");
		$this->name = htmlspecialchars(strip_tags($this->name));
		$this->description = htmlspecialchars(strip_tags($this->description));
		$this->price = htmlspecialchars(strip_tags($this->price));
		$this->category_id = htmlspecialchars(strip_tags($this->category_id));
		$this->created = htmlspecialchars(strip_tags($this->created));
		$stmt->bind_param("ssiis", $this->name, $this->description, $this->price, $this->category_id, $this->created);
		if($stmt->execute()){
			return true;
		}
		return false;		 
	}
		
	function update()
	{
		$stmt = $this->conn->prepare("UPDATE ".$this->table." SET name= ?, description = ?, price = ?, category_id = ?, created = ? WHERE id = ?");
		$this->id = htmlspecialchars(strip_tags($this->id));
		$this->name = htmlspecialchars(strip_tags($this->name));
		$this->description = htmlspecialchars(strip_tags($this->description));
		$this->price = htmlspecialchars(strip_tags($this->price));
		$this->category_id = htmlspecialchars(strip_tags($this->category_id));
		$this->created = htmlspecialchars(strip_tags($this->created));
		$stmt->bind_param("ssiisi", $this->name, $this->description, $this->price, $this->category_id, $this->created, $this->id);
		if($stmt->execute()){
			return true;
		}
		return false;
	}
	
	function delete()
	{
		$stmt = $this->conn->prepare("DELETE FROM ".$this->table." WHERE id = ?");
		$this->id = htmlspecialchars(strip_tags($this->id));
		$stmt->bind_param("i", $this->id);
		if($stmt->execute()){
			return true;
		}
		return false;		 
	} //*/
}
?>