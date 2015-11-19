<?php
	require('fpdf17/fpdf.php');//fpdf path
	//include_once('connection/config.php');// my db connection
	$connection = mysql_connect("localhost","root","") or die("Unable to connect !!");
	$db = mysql_select_db("pizza_inn") or die("Unable to select DB");
	$sel =array(1,3);

	$id=implode(",",$sel);
	//echo $id;
	$result=mysql_query("SELECT members.member_id, members.firstname, members.lastname, billing_details.Street_Address, billing_details.Mobile_No, orders_details.*, food_details.*, cart_details.*, quantities.* FROM members, billing_details, orders_details, quantities, food_details, cart_details WHERE members.member_id=orders_details.member_id AND billing_details.billing_id=orders_details.billing_id AND orders_details.cart_id=cart_details.cart_id AND cart_details.food_id=food_details.food_id AND cart_details.quantity_id=quantities.quantity_id");
	if($result == false){
		echo mysql_error();
	}
	//Initialize the 3 columns and the total
	$c_code = "";
	$c_name = "";
	$c_price = "";
	$c_real_quantity="";
	$c_total_cost="";
	$total = 0;
	$total_cost_final = 0;
	echo "<h2>Click here to download  reports";
	
	//For each row, add the field to the corresponding column
	while($row = mysql_fetch_array($result))
	{ 
	   $code =$row['order_id'];
	   $name = substr($row['Street_Address'],0,20);
	   $real_price = $row['food_price'];
	   $real_quantity = $row['quantity_value'];
	   $show =$row['food_price'];
	   $total_cost = $row['total'];
	   $total_cost_show = $row['total'];;

	 $c_code = $c_code.$code."\n";
	 $c_name = $c_name.$name."\n";
	 $c_price = $c_price.$show."\n";
	 $c_real_quantity = $c_real_quantity.$real_quantity."\n";
	 $c_total_cost = $c_total_cost.$total_cost."\n";

	//Sum all the Prices (TOTAL)
		$total = $total+$real_price;
		$total_cost_final = $total_cost_final +$total_cost_show;
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
	$pdf->SetX(125);
	$pdf->MultiCell(30,6,$c_real_quantity,1);
	
	$pdf->SetY(26);
	$pdf->SetX(135);
	$pdf->MultiCell(30,6,$c_price,1);
	
	
	$pdf->SetY(68);
	$pdf->SetX(134.5);
	$pdf->MultiCell(30,6,'TK'.$total_cost_final,1,'R');
	
	

	$filename="report.pdf";
	$pdf->Output($filename,'F');

	echo'<a href="report.pdf">Download your Report</a>';

?>
