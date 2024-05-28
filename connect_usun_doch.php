<?php
include 'connect.php';

// Sprawdzenie, czy dane formularza zostały przesłane
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pobranie danych z formularza
    $dochod_id = $_POST["dochod_id"];

    // Zapytanie SQL do usunięcia dochodu o określonym ID
    $sql = "DELETE FROM Dochody WHERE id=$dochod_id";

    if ($conn->query($sql) === TRUE) {
        echo "Dochód został pomyślnie usunięty";
    } else {
        echo "Błąd usuwania dochodu: " . $conn->error;
    }
}

// Zamknięcie połączenia z bazą danych
$conn->close();
?>
