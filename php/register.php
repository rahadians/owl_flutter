<?php

require "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$response 	= array();
	$username 	= $_POST['username'];
	$email 		= $_POST['email'];
	// $password 	= md5($_POST['password']);
	$password		= $_POST['password'];

	$check = "SELECT * FROM tbl_user WHERE email='$email'";
	$result = mysqli_fetch_array(mysqli_query($connect, $check));

	if (isset($result)) {
		# code...
		$response['value'] = 2;
		$response['message'] = "Email already in use";
		echo json_encode($response);
	} else {

		// $insert = "INSERT INTO tbl_user VALUE(NULL,'$username','$email','$password','1',NOW())";

		// $insert = "INSERT INTO tbl_user VALUE(NULL,'ab','ab@gmail.com','123456','1',NOW())";

		$insert = "INSERT INTO `tbl_user`(`id_user`, `username`, `email`, `password`, `level`, `register_date`) VALUES (NULL,'$username','$email',$password,'1',now())";


		if (mysqli_query($connect, $insert)) {
			$response['value'] = 1;
			$response['message'] = "Register Succesfully";
			echo json_encode($response);
		} else {
			$response['value'] = 0;

			$response['message'] = "Register not Succesfully";
			echo json_encode($response);
		}
	}
}
