<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Przypisywanie dochodów do określonych bużetów</title>
    <link rel="stylesheet" href="style8.css">
    <link rel="icon" href="img/logo_tylko.png">
    <style>
        .goal-form {
            background-color: #c0c0c0;
            border-radius: 5px;
            padding: 20px;
        }

        .goal-form h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .goal-form label,
        .goal-form input,
        .goal-form textarea,
        .goal-form button {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="column">
        <section class="goal-form">
            <h3>Przypisywanie dochodów do określonych bużetów</h3>
            <form action="dodaj_doch.php" method="post">
                <label for="zrodlo">Źródło dochodu:</label><br>
                <input type="text" id="zrodlo" name="zrodlo" required><br>


                <label for="kwota">Budz:</label><br>
                <label for="kwota">Kwota:</label><br>
                <input type="number" id="kwota" name="kwota" step="0.01" required><br>
            
                <label for="data">Data:</label><br>
                <input type="date" id="data" name="data" required><br>

                <label for="opis">Opis:</label><br>
                <textarea id="opis" name="opis"></textarea><br>

                <button type="submit">Przypisz</button>
            </form>
        </section>
    </div>
</body>
</html>
