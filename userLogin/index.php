<!-- <!DOCTYPE html>
<html>
<head>
	<title> Login Form in HTML5 and CSS3</title>
	<link rel="stylesheet" a href="user.css">
	<link rel="stylesheet" a href="..\css\font-awesome.min.css">
</head>
<body>
	<div class="container">
	<img src="image/login.png"/>
		<form method='POST' action='#' role="form" id="form-login">
			<div class="form-input">
				<input type="text" name="text" id="un" placeholder="Enter the User Name"/>	
			</div>
			<div class="form-input">
				<input type="password" name="password" id="pwd" placeholder="password"/>
			</div>
			<input type="submit" type="submit" value="LOGIN" class="btn-login"/>
		</form>
	</div>
</body> -->

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Online Ticket Reservation</title>

		<!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-theme.min.css">

	</head>
<body>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"> Online Ticketing</a>
		<ul class="nav navbar-nav">
			<li>
				<a href="#"></a>
			</li>
			<li>
				<a href="#"></a>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
	      <li><a href="../"><span class="glyphicon glyphicon-backward"></span> Return Home</a></li>
	    </ul>
	</div>
</nav>

<?php require_once('./message.php'); ?>

<div class="col-md-3"></div>
<div class="col-md-6">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Please Login Here</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" id="form-login">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="un">Username:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="un" placeholder="Enter Username" autofocus="" required="">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">Password:</label>
			    <div class="col-sm-10"> 
			      <input type="password" class="form-control" id="pwd" placeholder="Enter password" required="">
			    </div>
			  </div>
			  <div class="form-group"> 
			    <div class="col-sm-offset-2 col-sm-10">
			      <div class="checkbox">
			        <label><input type="checkbox"> Remember me</label>
			      </div>
			    </div>
			  </div>
			  <div class="form-group"> 
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Login
			      <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
			      </button>
			    </div>
			  </div>
			</form>
		</div>
	</div>
</div>
<div class="col-md-3"></div>


<script type="text/javascript" src="../assets/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).on('submit', '#form-login', function(event) {
		event.preventDefault();
		var un = $('#un').val();
		var pwd = $('#pwd').val();

		$.ajax({
				url: '../data/login.php',
				type: 'post',
				dataType: 'json',
					data: {
						un: un,
						pwd : pwd
					},
				success: function (data) {
					console.log(data);
                    if(un == "admin") {
                        window.alert("enter valid user name or password")
                    } else {
					if(data.valid == true){
						window.location = "../reserved.php";
					}else{
						$('#modal-message').find('#body-cont').text(data.msg);
						$('#modal-message').modal('show');
						$('#un').val("");
						$('#pwd').val("");
						$('#un').focus();
					}
                    }
				},
				error: function(){
					alert('Error: L99+');
				}
                //
			});
	});

</script>
</html>