<?php
	require('fpdf17/fpdf.php');//fpdf path
	//include_once('connection/config.php');// my db connection
	$connection = mysql_connect("localhost","root","") or die("Unable to connect !!");
	$db = mysql_select_db("pizza_inn") or die("Unable to select DB");
	$sel =array(1,3);

	$id=implode(",",$sel);
	//echo $id;
	$result=mysql_query("select * from  receipt");
	if($result == false){
		echo mysql_error();
	}
	//Initialize the 3 columns and the total
	$c_code = "";
	$c_name = "";
	$c_price = "";
	$total = 0;
	echo "<h2>MySQL Data Report</h2>";
	echo "<br/>";
	//For each row, add the field to the corresponding column
	while($row = mysql_fetch_array($result))
	{ 
	   $code =$row['id'];
	   $name = substr($row['company'],0,20);
	   $real_price = $row['total'];
	   $show =$row['total'];

	 $c_code = $c_code.$code."\n";
	 $c_name = $c_name.$name."\n";
	 $c_price = $c_price.$show."\n";

	//Sum all the Prices (TOTAL)
		$total = $total+$real_price;
	}
	mysql_close();

	$total = $total;
	//Create a new PDF file
	$pdf=new FPDF();
	$pdf->AddPage();

	//Now show the 3 columns
	$pdf->SetFont('Arial','',14);
	$pdf->SetY(26);
	$pdf->SetX(45);
	$pdf->MultiCell(20,6,$c_code,1);
	$pdf->SetY(26);
	$pdf->SetX(65);
	$pdf->MultiCell(100,6,$c_name,1);
	$pdf->SetY(26);
	$pdf->SetX(135);
	$pdf->MultiCell(30,6,$c_price,1,'R');
	$pdf->SetX(135);
	$pdf->MultiCell(30,6,'$ '.$total,1,'R');

	$filename="invoice.pdf";
	$pdf->Output($filename,'F');

	echo'<a href="invoice.pdf">Download your Report</a>';

?>
