<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php echo e($message ?? "Mensagem de erro"); ?></title>
</head>
<body>

    <div style="text-align: center">
        <h3><?php echo e($message ?? "Mensagem de erro!"); ?></h3>
        <p><?php echo e($code ?? "Code of error!"); ?></p>
        <p><?php echo e($file ?? "File of error!"); ?></p>
        <p><?php echo e($line ?? "Line of error!"); ?></p>
    </div>

</body>
</html><?php /**PATH /home/alexandrefn/projects/frame-devs/managerUser/views/errors/throwableDefault.blade.php ENDPATH**/ ?>