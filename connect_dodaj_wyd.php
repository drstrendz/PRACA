<?php
include 'connect.php';

// Upewniamy się, że dane zostały przekazane poprzez formularz POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sprawdzamy, czy wszystkie wymagane pola formularza zostały przekazane
    if (isset($_POST['kategoria']) && isset($_POST['kwota']) && isset($_POST['data'])) {
        // Pobieramy dane z formularza
        $kategoria = $_POST['kategoria'];
        $kwota = $_POST['kwota'];
        $data = $_POST['data'];
        $opis = isset($_POST['opis']) ? $_POST['opis'] : '';

        // Sprawdzamy, czy istnieje sesja i czy zalogowany użytkownik ma przypisane id
        session_start();
        if (!isset($_SESSION['user_id'])) {
            echo "Nie jesteś zalogowany.";
            exit();
        }
        $user_id = $_SESSION['user_id'];

        // Sprawdzamy, czy istnieje użytkownik o podanym id
        $check_user_sql = "SELECT id FROM Uzytkownik WHERE id = ?";
        $check_user_stmt = $conn->prepare($check_user_sql);
        $check_user_stmt->bind_param("i", $user_id);
        $check_user_stmt->execute();
        $check_user_result = $check_user_stmt->get_result();

        // Jeśli użytkownik istnieje, dodajemy nowy wydatek
        if ($check_user_result->num_rows == 1) {
            $add_wyd_sql = "INSERT INTO Wydatki (kategoria, data, kwota, opis, uzytkownik_id) VALUES (?, ?, ?, ?, ?)";
            $add_wyd_stmt = $conn->prepare($add_wyd_sql);
            $add_wyd_stmt->bind_param("ssdsi", $kategoria, $data, $kwota, $opis, $user_id);
            
            if ($add_wyd_stmt->execute()) {
                echo "Wydatek dodany pomyślnie.";
            } else {
                echo "Błąd podczas dodawania wydatku: " . $conn->error;
            }
        } else {
            echo "Nieprawidłowy użytkownik.";
        }
    } else {
        echo "Nieprawidłowe dane formularza.";
    }
} else {
    echo "Metoda żądania nieprawidłowa.";
}
?>
