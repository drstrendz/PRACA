<?php
include 'connect.php';

// Sprawdzenie, czy dane formularza zostały przesłane
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pobranie danych z formularza
    $dochod_id = $_POST["dochod_id"];
    $nowe_zrodlo = $_POST["nowe_zrodlo"];
    $nowa_kwota = $_POST["nowa_kwota"];
    $nowa_data = $_POST["nowa_data"];
    $nowy_opis = $_POST["nowy_opis"];

    // Zapytanie SQL do aktualizacji danych dochodu
    $sql = "UPDATE Dochody SET zrodlo='$nowe_zrodlo', kwota=$nowa_kwota, data='$nowa_data', opis='$nowy_opis' WHERE id=$dochod_id";

    if ($conn->query($sql) === TRUE) {
        echo "Dochód został pomyślnie zaktualizowany";
    } else {
        echo "Błąd aktualizacji dochodu: " . $conn->error;
    }
}

// Zamknięcie połączenia z bazą danych
$conn->close();
?>
