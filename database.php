<?php


$dbServer = "127.0.0.1";
	$dbUser = "root";
	$dbPass = "";
	$dbName = "db";


	function ConnectToDb ($server, $user, $pass, $database)
    {

        $link = new mysqli($server, $user, $pass, $database);

        if ($link->connect_errno)
        {
            echo "Error";
            return false;
        }
        else
        {
            return $link;
        }
    }

?>