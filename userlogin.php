<?php

	header("Cache-Control: no-cache, post-check=0, pre-check=0");
	header("Content-type:text/html;charset=utf-8");

	session_start();
	$_SESSION['username']='';

	$username = $_GET['username'];
	$password = $_GET['password'];
	$con = mysqli_connect("localhost","root","sydsg2q");

	mysqli_select_db($con,"BusControlSystem");
	$sql1 = "SELECT Username FROM user WHERE Username='".$username."' AND Password='".$password."'";
	
	$RS0 = mysqli_query($con,$sql1);
	if (mysqli_affected_rows($con)>0)	//查询函数，如果可查询到结果，则返回行数
	{
		$RS = mysqli_fetch_array($RS0);
		$_SESSION['username'] = $RS['Username'];
		echo $_SESSION['username'];
		//header("location: main.php");
	}  
	else
	{
		echo "Wrong,重新输入！";
		//header("location: login.html");
	}

?>

