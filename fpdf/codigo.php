<?php
define('FPDF_FONTPATH','font/');
require_once('fpdf.php');
include("../conectar.php");
//require('code39.php');

$codigo=$_GET["codigo"];
$sel_articulo="SELECT * FROM articulos WHERE codigobarras='$codigo'";
$rs_articulo=mysql_query($sel_articulo);

$descripcion=mysql_result($rs_articulo,0,"descripcion_corta");
$referencia=mysql_result($rs_articulo,0,"referencia");
$codigobarras=mysql_result($rs_articulo,0,"codigobarras");
$descripcion=substr($descripcion,0,31);
$precio=mysql_result($rs_articulo,0,"precio_tienda");
$precio=number_format($precio,2,",",".");

class PDF extends FPDF
{
function EAN13($x,$y,$barcode,$h=10,$w=.28)
{
	$this->Barcode($x,$y,$barcode,$h,$w,13);
}

function UPC_A($x,$y,$barcode,$h=8,$w=.25)
{
	$this->Barcode($x,$y,$barcode,$h,$w,12);
}

function GetCheckDigit($barcode)
{
	//Compute the check digit
	$sum=0;
	for($i=1;$i<=11;$i+=2)
		$sum+=3*$barcode{$i};
	for($i=0;$i<=10;$i+=2)
		$sum+=$barcode{$i};
	$r=$sum%10;
	if($r>0)
		$r=10-$r;
	return $r;
}

function TestCheckDigit($barcode)
{
	//Test validity of check digit
	$sum=0;
	for($i=1;$i<=11;$i+=2)
		$sum+=3*$barcode{$i};
	for($i=0;$i<=10;$i+=2)
		$sum+=$barcode{$i};
	return ($sum+$barcode{12})%10==0;
}

function Barcode($x,$y,$barcode,$h,$w,$len)
{
	//Padding
	$barcode=str_pad($barcode,$len-1,'0',STR_PAD_LEFT);
	if($len==12)
		$barcode='0'.$barcode;
	//Add or control the check digit
	if(strlen($barcode)==13) {}
		//$barcode.=$this->GetCheckDigit($barcode);
	elseif(!$this->TestCheckDigit($barcode))
		$this->Error('Error codigo incorrecto');
	//Convert digits to bars
	$codes=array(
		'A'=>array(
			'0'=>'0001101','1'=>'0011001','2'=>'0010011','3'=>'0111101','4'=>'0100011',
			'5'=>'0110001','6'=>'0101111','7'=>'0111011','8'=>'0110111','9'=>'0001011'),
		'B'=>array(
			'0'=>'0100111','1'=>'0110011','2'=>'0011011','3'=>'0100001','4'=>'0011101',
			'5'=>'0111001','6'=>'0000101','7'=>'0010001','8'=>'0001001','9'=>'0010111'),
		'C'=>array(
			'0'=>'1110010','1'=>'1100110','2'=>'1101100','3'=>'1000010','4'=>'1011100',
			'5'=>'1001110','6'=>'1010000','7'=>'1000100','8'=>'1001000','9'=>'1110100')
		);

	$parities=array(
		'0'=>array('A','A','A','A','A','A'),
		'1'=>array('A','A','B','A','B','B'),
		'2'=>array('A','A','B','B','A','B'),
		'3'=>array('A','A','B','B','B','A'),
		'4'=>array('A','B','A','A','B','B'),
		'5'=>array('A','B','B','A','A','B'),
		'6'=>array('A','B','B','B','A','A'),
		'7'=>array('A','B','A','B','A','B'),
		'8'=>array('A','B','A','B','B','A'),
		'9'=>array('A','B','B','A','B','A')
		);
	$code='101';
	$p=$parities[$barcode{0}];
	for($i=1;$i<=6;$i++)
		$code.=$codes[$p[$i-1]][$barcode{$i}];
	$code.='01010';
	for($i=7;$i<=12;$i++)
		$code.=$codes['C'][$barcode{$i}];
	$code.='101';
	//Draw bars
	for($i=0;$i<strlen($code);$i++)
	{
		if($code{$i}=='1')
			$this->Rect($x+$i*$w,$y,$w,$h,'F');
	}
	//Print text uder barcode
	$this->SetFont('Arial','',5);
	$this->Text($x+7,$y+$h+6/$this->k,substr($barcode,-$len));
}
}

$pdf=new PDF(); 
define('EURO',$simbolomoneda);
//$pdf=new PDF (P,mm,array(29,25) );
$pdf=new PDF (P,mm,array(210,297) );

$pdf->Open();
$pdf->AddPage();

$pdf->SetFont('Arial','',5);

$pdf->Text(2,3,$descripcion);
$pdf->EAN13(1,5,$codigobarras);
//$pdf->Text(15,22,$codigobarras);

//para arriba fila 1

$pdf->Text(43,3,$descripcion);//+41
$pdf->EAN13(43,5,$codigobarras);//+41
//$pdf->Text(58,22,$codigobarras);//+43

$pdf->Text(84,3,$descripcion);
$pdf->EAN13(84,5,$codigobarras);


$pdf->Text(125,3,$descripcion);
$pdf->EAN13(125,5,$codigobarras);


$pdf->Text(166,3,$descripcion);
$pdf->EAN13(166,5,$codigobarras);


//para abajo columna 1
$pdf->Text(2,29,$descripcion);
$pdf->EAN13(1,31,$codigobarras);


$pdf->Text(2,55,$descripcion);//+26
$pdf->EAN13(1,57,$codigobarras);//+26


$pdf->Text(2,81,$descripcion);
$pdf->EAN13(1,83,$codigobarras);


$pdf->Text(2,107,$descripcion);
$pdf->EAN13(1,109,$codigobarras);


$pdf->Text(2,133,$descripcion);
$pdf->EAN13(1,135,$codigobarras);


$pdf->Text(2,159,$descripcion);
$pdf->EAN13(1,161,$codigobarras);


$pdf->Text(2,185,$descripcion);
$pdf->EAN13(1,187,$codigobarras);


$pdf->Text(2,211,$descripcion);
$pdf->EAN13(1,213,$codigobarras);


$pdf->Text(2,237,$descripcion);
$pdf->EAN13(1,239,$codigobarras);


$pdf->Text(2,263,$descripcion);
$pdf->EAN13(1,265,$codigobarras);



//fila 2
$pdf->Text(43,29,$descripcion);
$pdf->EAN13(43,31,$codigobarras);


$pdf->Text(43,55,$descripcion);//+26
$pdf->EAN13(43,57,$codigobarras);//+26


$pdf->Text(43,81,$descripcion);
$pdf->EAN13(43,83,$codigobarras);


$pdf->Text(43,107,$descripcion);
$pdf->EAN13(43,109,$codigobarras);


$pdf->Text(43,133,$descripcion);
$pdf->EAN13(43,135,$codigobarras);


$pdf->Text(43,159,$descripcion);
$pdf->EAN13(43,161,$codigobarras);


$pdf->Text(43,185,$descripcion);
$pdf->EAN13(43,187,$codigobarras);


$pdf->Text(43,211,$descripcion);
$pdf->EAN13(43,213,$codigobarras);


$pdf->Text(43,237,$descripcion);
$pdf->EAN13(43,239,$codigobarras);


$pdf->Text(43,263,$descripcion);
$pdf->EAN13(43,265,$codigobarras);



//fila 3
$pdf->Text(84,29,$descripcion);
$pdf->EAN13(84,31,$codigobarras);


$pdf->Text(84,55,$descripcion);//+26
$pdf->EAN13(84,57,$codigobarras);//+26


$pdf->Text(84,81,$descripcion);
$pdf->EAN13(84,83,$codigobarras);


$pdf->Text(84,107,$descripcion);
$pdf->EAN13(84,109,$codigobarras);


$pdf->Text(84,133,$descripcion);
$pdf->EAN13(84,135,$codigobarras);


$pdf->Text(84,159,$descripcion);
$pdf->EAN13(84,161,$codigobarras);


$pdf->Text(84,185,$descripcion);
$pdf->EAN13(84,187,$codigobarras);


$pdf->Text(84,211,$descripcion);
$pdf->EAN13(84,213,$codigobarras);


$pdf->Text(84,237,$descripcion);
$pdf->EAN13(84,239,$codigobarras);


$pdf->Text(84,263,$descripcion);
$pdf->EAN13(84,265,$codigobarras);


//fila 4
$pdf->Text(125,29,$descripcion);
$pdf->EAN13(125,31,$codigobarras);


$pdf->Text(125,55,$descripcion);//+26
$pdf->EAN13(125,57,$codigobarras);//+26


$pdf->Text(125,81,$descripcion);
$pdf->EAN13(125,83,$codigobarras);


$pdf->Text(125,107,$descripcion);
$pdf->EAN13(125,109,$codigobarras);


$pdf->Text(125,133,$descripcion);
$pdf->EAN13(125,135,$codigobarras);


$pdf->Text(125,159,$descripcion);
$pdf->EAN13(125,161,$codigobarras);


$pdf->Text(125,185,$descripcion);
$pdf->EAN13(125,187,$codigobarras);


$pdf->Text(125,211,$descripcion);
$pdf->EAN13(125,213,$codigobarras);


$pdf->Text(125,237,$descripcion);
$pdf->EAN13(125,239,$codigobarras);


$pdf->Text(125,263,$descripcion);
$pdf->EAN13(125,265,$codigobarras);



//fila 5
$pdf->Text(166,29,$descripcion);
$pdf->EAN13(166,31,$codigobarras);


$pdf->Text(166,55,$descripcion);//+26
$pdf->EAN13(166,57,$codigobarras);//+26


$pdf->Text(166,81,$descripcion);
$pdf->EAN13(166,83,$codigobarras);


$pdf->Text(166,107,$descripcion);
$pdf->EAN13(166,109,$codigobarras);


$pdf->Text(166,133,$descripcion);
$pdf->EAN13(166,135,$codigobarras);


$pdf->Text(166,159,$descripcion);
$pdf->EAN13(166,161,$codigobarras);


$pdf->Text(166,185,$descripcion);
$pdf->EAN13(166,187,$codigobarras);


$pdf->Text(166,211,$descripcion);
$pdf->EAN13(166,213,$codigobarras);


$pdf->Text(166,237,$descripcion);
$pdf->EAN13(166,239,$codigobarras);


$pdf->Text(166,263,$descripcion);
$pdf->EAN13(166,265,$codigobarras);






/* por el momento no necesito que la etiqueta de código de barras muestre el precio o la referencia del producto.
  
$pdf->SetFont('Arial','',7);
$pdf->Text(1,19,"Ref.: ".$referencia);  
$pdf->SetFont('Arial','',9);    
$pdf->Text(1,23,"PVP: ".$precio." ".EURO);

*/

$pdf->Output();
?>
