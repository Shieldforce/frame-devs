<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="{{ asset("favicon.png") }}">

    <title>{{ envSystem("APP_NAME") ?? "FrameDevs" }}</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset("assets/css/bootstrap.min.css") }}" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="{{ asset("assets/css/cover.css") }}" rel="stylesheet">
</head>

<body class="text-center">

<div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand"><img src="{{ asset("favicon.png") }}" alt="Logo"></h3>
            <nav class="nav nav-masthead justify-content-center">

                <a class="nav-link" href="{{ url("https://mobiconectividades.com.br") }}" target="_blank">Doc</a>
                <a class="nav-link" href="{{ url("https://mobiconectividades.com.br") }}" target="_blank">GitHub</a>
            </nav>
        </div>
    </header>

    @yield("content")

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Todos os direitos reservados para <a href="{{ url("https://mobiconectividades.com.br") }}" target="_blank">{{ app("APP_NAME") }}</a>.</p>
        </div>
    </footer>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="{{ asset("assets/js/vendor/jquery-slim.min.js") }}"><\/script>')</script>
<script src="{{ asset("assets/js/vendor/popper.min.js") }}"></script>
<script src="{{ asset("assets/js/bootstrap.min.js") }}"></script>
</body>
</html>
