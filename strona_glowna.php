<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include 'imie.php';
include 'sprawdz_cele.php';  // Dołączenie pliku sprawdzającego cele użytkownika
include 'powiadomienie_cele.php';  // Dołączenie pliku losującego powiadomienia motywujące
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona główna</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="img/logo_tylko.png">
</head>
<body>
    <header id="header"> 
        <img src="img/logo_obrot.png">
        <nav>   
            <ul id="zakladki">    
                <li><a href="strona_glowna.php">Strona główna</a></li>    
                <li><a href="strona_budz.php">Stwórz budżet</a></li>    
                <li><a href="strona_wyd.php">Zarządzaj wydatkami</a></li>    
                <li><a href="strona_doch.php">Zarządzaj dochodami</a></li>
                <li><a href="strona_cele.php">Cele oszczędnościowe</a></li>
                <li><a href="strona_tren.php">Trendy</a></li>
                <li><a href="strona_rap.php">Raporty</a></li>
                <li><a href="logowanie.php" id="link-menu">Wyloguj</a></li>
            </ul> 
        </nav> 
    </header>

    <section id="baner">
        <p><?php echo date('Y-m-d'); ?></p>
        <h1><?php echo "Cześć " .  $imie; ?>!</h1>
    </section>

    <section id="cel">
    
    <h5 id="pcel" style="color: #fff; font-style: italic; font-size: 30px; background-color: #09491b;
    text-align: center; border-radius: 5px;"><?php echo $_SESSION['powiadomienie']; ?></h5> <!-- Dodane style bezpośrednio -->
    <h3>CELE:</h3>  
    <?php foreach ($_SESSION['cele'] as $cel) : ?>
        <h5><?php echo $cel; ?></h5>
    <?php endforeach; ?>
  
    <a href="strona_cele.php" class="link-z"><h6>Zarządzaj</h6></a>
</section>

    <section id="budzet">
        <h3>BUDŻETY:</h3>
        <h5>*wszystko jest git* lub *limit budżetu wyczerpany*</h5>
        <a href="strona_budz.php" class="link-z"><h6>Zarządzaj</h6></a>
    </section>
</body>
</html>
