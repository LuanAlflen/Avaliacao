<?php
include_once "conexao.php";
?>
<html lang="pt-BR">
<head>
    <meta charset=UTF-8>
    <title>Artigo Single</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/avaliations.js"></script>
</head>

<body>
<?php
session_start();
$idartigo = (int)$_GET['id'];
$idusuario = '2';
$_SESSION['idusuario'] = $idusuario;
$sqlhistvoto = "SELECT * FROM historicovotos WHERE idusuario = ".$idusuario." AND idartigo = ".$idartigo.";";
$pegahistvoto = $pdo->prepare($sqlhistvoto);
$pegahistvoto->execute(array());
$existehistorico = "0";
while($hist = $pegahistvoto->fetchObject()) {
    $existehistorico = $hist->idusuario;
    $nota = $hist->nota;
}
$pegaArtigo = $pdo->prepare("SELECT * FROM `artigos` WHERE id = ?");
$pegaArtigo->execute(array($idartigo));
while($artigo = $pegaArtigo->fetchObject()){
$calculo = ($artigo->pontos == 0) ? 0 : round(($artigo->pontos/$artigo->votos), 1);
?>
<h1><?php echo utf8_encode($artigo->titulo);?> - <a href="index.php">Voltar</a></h1>
<span class="ratingAverage" data-average="<?php echo $calculo;?>"></span>
<?php
if ($existehistorico == "0") {
    echo "<span class='article' data-id=".$idartigo."></span>";
}
else {
    echo "Você já votou! Sua nota é ".$nota;
}
?>
<div class="barra">
    <span class="bg"></span>
    <span class="stars">
                <?php for($i=1; $i<=5; $i++):?>
                    <span class="star" data-vote="<?php echo $i;?>"> <!-- soma os votos -->
                    <span class="starAbsolute"></span>
                </span>
                    <?php
                endfor;
                echo '</span></div><p class="votos"><span>'.$artigo->votos.'</span> votos</p>';
                }
                ?>
            </span>
</div>

</body>
</html>