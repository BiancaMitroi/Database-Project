<html>
<style>
	body
	{
	background-image: url('xy.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	}
	h1
	{
		color: white;
		font-family: Century Gothic;
		font-size: 25px;
	}
	p
	{
		margin-left: 80%;
		margin-top: 8%;
		font-family: Century Gothic;
		font-size: 25px;
		color: white;
	}
	button
	{
		font-size: 50px;
		border-radius: 25px 25px 25px 25px;
		border: 5px solid white;
		background-color: transparent;
		color: white;
		font-family: Century Gothic;
		transition-duration: 1s;
	}
	button:hover
	{
		background-color: black;
	}

</style>
	
    <head>
        <title>Exercitiu 5 b)</title>
    </head>
    <body>
	<table style><tr><td><a href = "site.html"><button><img src = "back.png" style = "width:40px; height: 40px;"></button></a></td>
	
        <td><h1>5 b) Să se găsească devizele din anul 2021 (data_introducere) cu totalul cel mai mare.</h1></td></tr></table>
		
        <?php
            // se precizează că se foloseşte PEAR DB
            require_once('PEAR.php');
			$host = 'localhost';
            $user = 'mb';
			$pass = 'embi';
            $db_name = 'proiect';
            // se stabileşte şirul pentru conexiune universală sau DSN
			$dsn= new mysqli($host, $user, $pass, $db_name);
            // conectare la BD
            if ($dsn->connect_error)
			{
				die('Eroare la conectare:'. $dsn->connect_error);
			}
            // se emite interogarea
            $query = "CALL Ex5b();";
            $result = mysqli_query($dsn, $query);
            // verifică dacă rezultatul este în regulă
            if (!$result)
            {
				die('Interogare gresita :'.mysqli_error($dsn));
            }
            // se obţine numărul tuplelor returnate
            $num_results = mysqli_num_rows($result);
            // se afişează fiecare tuplă returnată
			echo '<center><table style = "width:50%; font-family: Century Gothic; background-color: black; opacity: 80%;">
			<tr>
			 <th style = "border: 2px solid white; color: white;">ID_D</th>
			 <th style = "border: 2px solid white; color: white;">TOTAL</th>
			</tr>';
			for ($i=0; $i <$num_results; $i++)
			{
				$row = mysqli_fetch_assoc($result);
				echo '<tr><td style = "border: 2px solid white; color: white;">'.stripslashes($row['id_d']).'</td>';
				echo '<td style = "border: 2px solid white; color: white;">'.stripslashes($row['total']).'</td>';
			}
			echo '</table></center>';
            // deconectarea de la BD
            mysqli_close($dsn);
            ?>
    </body>
</html>