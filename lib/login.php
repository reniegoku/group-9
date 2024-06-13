<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tabletester";
$port = "3308";

// try {
//     $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);
//     $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//     echo "Connected successfully";
// } catch (PDOException $e) {
//     die("Connection failed: ". $e->getMessage());
// }

// $conn = null;

$conn = mysqli_connect($servername, $username, $password, $dbname, $port);
if (!$conn){
    echo "Connection Failed!";
} else {
    echo "Connection Success!";
}

$username = $_POST['username'];
$password = $_POST['password'];

// Query to check username and password
$query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = $conn->query($query);

// Check if user exists
if ($result->num_rows > 0) {
    // User exists, return success
    echo 'success';
} else {
    // User does not exist, return error
    echo 'error';
}

// Close connection
$conn->close();
?>