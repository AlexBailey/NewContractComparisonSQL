<!DOCTYPE html>

<html>

<head>
<link rel="icon" href="favicon.ico" type="image/x-icon"/>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
<meta charset="UTF-8">
<title>Contract Finder 3000</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<style type="text/css">
	body {
		background-color: #ffffff;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		}
</style>
</head>

<body>
<h1>Contract finder 3000</h1>
<h2 style="margin-bottom:75px;">Select your desired phone and contract length,<br>and we will show you the best value tariffs available.</h2>

<?php

include 'database.php';

$database = ConnectToDb($dbServer, $dbUser, $dbPass, $dbName);

$get_contract_lengths_string = "SELECT DISTINCT length FROM contract";
$query_string = "SELECT device.device_id, CONCAT( brand.name,' ' ,device.name ) AS phone_name FROM Device, Brand WHERE device.brand_id = brand.brand_id";
$query_result = $database->query($query_string);
$query_result_contract = $database->query($get_contract_lengths_string);

if (!$query_result) { 
    die('Invalid query: ' . $database->error);
}

if (!$query_result_contract) { 
    die('Invalid query: ' . $database->error);
}


echo "
<div style= 'color:#000000; font-family: Tahoma, sans-serif; font-size: 48px; text-transform: uppercase; display: inline;'>
<span>I want a</span>
</div>
<form style='display: inline;' action='view.php' method='POST'>
	<select name='device_name'>";

while ($row = $query_result->fetch_assoc()) {
    print_r($row);
    echo "<option>" . $row['phone_name'] . "</option>";
}

echo "</select>";

echo "
<div style= 'color:#000000; font-family: Tahoma, sans-serif; font-size: 48px; text-transform: uppercase; display: inline;'>
<span>on a</span>
</div>
<select name='length'>";
while ($row1 = $query_result_contract->fetch_assoc()) {
    echo "<option> " . $row1['length'] . "</option>";

}
echo "</select>
<div style= 'color:#000000; font-family: Tahoma, sans-serif; font-size: 48px; text-transform: uppercase; display: inline;'>
<span>month contract,</span>
</div>";

echo "<button style='
	font-face:
	font-family: Tahoma, sans-serif;
	font-size: 48px;
	margin-left: 1px;
	margin-right: 1px;
	margin-bottom: 25px;
	background: #ffffff;
	padding: 10px;
	line-height: 1;
	border: 3px;
	border-style: solid;
	border-color: #000000;
	border-radius: 0px;
	-webkit-appearance: none;'
	type='submit'>
PLEASE
</button>
</form>";

echo "<span>.</span></div>"

?>


</body>
</style>
</head>
</html>
