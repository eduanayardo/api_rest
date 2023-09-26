<?php
class Database{
	private $host  = '172.18.0.2';
    private $user  = 'root';
    private $password   = "root";
    private $database  = "db_mexico"; 
    
    public function getConnection()
	{		
		$conn = new mysqli($this->host, $this->user, $this->password, $this->database);
		if ($conn->connect_error) {
			die("Error failed to connect to MySQL: ".$conn->connect_error);
		} else {
			return $conn;
		}
    }
}
?>