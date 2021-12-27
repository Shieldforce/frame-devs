<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<?php echo e(asset("favicon.png")); ?>">

    <title><?php echo e($message ?? "Mensagem de erro"); ?></title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo e(asset("assets/css/bootstrap.min.css")); ?>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<?php echo e(asset("assets/css/cover.css")); ?>" rel="stylesheet">
</head>

<body class="text-center">

<div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand"><img src="<?php echo e(asset("favicon.png")); ?>" alt="Logo"></h3>
            <nav class="nav nav-masthead justify-content-center">
                
            </nav>
        </div>
    </header>

    <?php echo $__env->yieldContent("content"); ?>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Todos os direitos reservados para <a href="<?php echo e(url("https://mobiconectividades.com.br")); ?>" target="_blank"><?php echo e(app("APP_NAME")); ?></a>.</p>
        </div>
    </footer>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<?php echo e(asset("assets/js/vendor/jquery-slim.min.js")); ?>"><\/script>')</script>
<script src="<?php echo e(asset("assets/js/vendor/popper.min.js")); ?>"></script>
<script src="<?php echo e(asset("assets/js/bootstrap.min.js")); ?>"></script>
</body>
</html>
<?php /**PATH /home/alexandrefn/projects/frame-devs/managerUser/views/errors/template/index.blade.php ENDPATH**/ ?>