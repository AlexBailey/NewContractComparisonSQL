<!DOCTYPE html>

<?php

$fetched_name = $_POST['device_name'];
$fetched_length = $_POST['length'];
include 'database.php';

$database = ConnectToDb($dbServer, $dbUser, $dbPass, $dbName);


$queryString = "SELECT DISTINCT carrier.name AS carrier_name, contract.handset_price, contract.texts, contract.minutes, contract.data, contract.monthly_price, device.name, contract.length
                  FROM carrier,contract,device,brand
                WHERE contract.length = '$fetched_length'
                AND CONCAT( brand.name,' ' ,device.name ) = '$fetched_name'
                AND carrier.carrier_id = contract.carrier_id
                AND contract.device_id = device.device_id
                AND device.brand_id = brand.brand_id";


$query = $database->query($queryString);
if (!$query) { // add this check.
    die('Invalid query: ' . $database->error);
}

echo "<html>
		<head>
		<title>";
echo $fetched_name;
echo " - ";
echo $fetched_length;
echo " Months</title>
		</head>
		<body>
		<h1 style='color:#000000; font-family: Tahoma, sans-serif; font-weight: bold; font-size: 48px; text-align: center; text-transform: uppercase;'>";
echo $fetched_name;

echo "</h1>
		<h2 style='color:#000000; font-family: Helvetica, Tahoma, sans-serif; font-weight: bold; font-size: 24px; text-align: center; text-transform: uppercase;'>All plans represent a ";
echo $fetched_length;
echo " month contract</h2>
		<div style='width:750px; margin-top: 75px; margin-left: auto; margin-right: auto; margin-bottom: 25px; padding: 15px; border: 3px; border-style: solid; border-color: #000000; border-radius: 0px;'>";

echo "<table border=1 style='width:750px;'>
        <tr style='height:50px; font-family: Helvetica, Tahoma, sans-serif; font-size: 14px; text-align:center; background-color: #89c1f5; font-weight: bold; color: #000000;'>
		<td>Carrier</td>
		<td>Monthly Price</td>
		<td>Handset Price</td>
		<td>Texts</td>
		<td>Minutes</td>
		<td>Data</td>
		</tr>";

function addCurrencyChar($price)
{
    if ($price != "Free")
    {
        return '&pound;'.$price;
    }
    else
    {
        return $price;
    }
}

while ($row = $query->fetch_assoc()) {

    $monthly_price = addCurrencyChar($row['monthly_price']);
    $handset_price = addCurrencyChar($row['handset_price']);

    echo "<tr style='height:50px; background-color: #d1e8fe; color:#666666; font-family: Helvetica, Tahoma, sans-serif; font-size: 14px; text-align:center;'>";
    echo "<td style='background-color: #89c1f5; font-weight: bold; color: #000000;'>" . $row['carrier_name'] . "</td>";
    echo "<td>" . $monthly_price . "</td>";
    echo "<td>" . $handset_price . "</td>";
    echo "<td>" . $row['texts'] . "</td>";
    echo "<td>" . $row['minutes'] . "</td>";
    echo "<td>" . $row['data'] . "</td>";
    echo "</tr>";

}
echo "</table>";
echo "

</div>
		  <div style='font-family: Tahoma, sans-serif; font-size: 48px; margin-left: auto; margin-right: auto; text-align: center; width: 220px; background: #ffffff; padding: 10px; border: 3px; border-style: solid; border-color: #000000; border-radius: 0px;'>
		      <a style='color: #000000; text-decoration: none;' href='index.php'>BACK</a>
		  </div>
    </body>

</html>";
?>