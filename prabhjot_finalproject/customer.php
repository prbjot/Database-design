<?php
// database connection code
if(isset($_POST['txtfName']))
{
 //$con = mysqli_connect('localhost', 'database_user', 'database_password','database');
$con = mysqli_connect('localhost', 'root', '','pizza_db');

// get the post records
$txtfName = $_POST['txtfName'];
$txtlName = $_POST['txtlName'];
$txtPhone = $_POST['txtPhone'];
$txtAddress = $_POST['txtAddress'];

// database insert SQL code
$sql = "INSERT INTO `customer` (`first_name`, `last_name`, `phone`, `address`) VALUES ('$txtfName', '$txtlName', '$txtPhone', '$txtAddress')";

// insert in database
$rs = mysqli_query($con, $sql);
if($rs)
{
	echo "Record Inserted";
}
}
else
{
	echo "Record does not inserted";

}
?>
