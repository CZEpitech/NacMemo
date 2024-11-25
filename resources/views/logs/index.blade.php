<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laravel Logs</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    pre {
        white-space: pre-wrap;
        /* Permet le retour à la ligne automatique */
        word-wrap: break-word;
        background: #f4f4f4;
        padding: 10px;
        border-radius: 5px;
        overflow: auto;
        max-height: 500px;
        /* Limite la hauteur */
    }

    h1 {
        font-size: 24px;
        color: #333;
    }

    .log-content {
        font-size: 14px;
        color: #555;
    }
    </style>
</head>

<body>
    <div class="container">
        <h1>Laravel Logs</h1>
        <div class="log-content">
            @if ($logs)
            <pre>{{ $logs }}</pre>
            @else
            <p>Aucun log trouvé.</p>
            @endif
        </div>
    </div>
</body>

</html>