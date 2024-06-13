<?php
// Configuration
$db_host = 'localhost';
$db_username = 'root';
$db_password = '';
$db_name = 'tabletester';
$db_port = '3308';

// Connect to database
$conn = new mysqli($db_host, $db_username, $db_password, $db_name, $db_port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to retrieve student
$query = "SELECT * FROM student";
$result = $conn->query($query);

// Check if query was successful
if ($result->num_rows > 0) {
    // Create an array to store the students
    $student = array();

    // Loop through the results and add to the array
    while($row = $result->fetch_assoc()) {
        $student[] = $row;
    }

    // Encode the array as JSON and output
    echo json_encode($student);
} else {
    echo 'No student found';
}

// Close connection
$conn->close();
?>