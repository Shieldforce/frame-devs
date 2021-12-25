<form action="/teste" method="POST">
    <input type="hidden" name="_method" value="post">
    <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
    <label class="col-12">
        <textarea name="contentReport" class="col-12 form-control" rows="5" autofocus></textarea>
    </label>
    <button type="submit" class="btn btn-danger">Enviar</button>
</form><?php /**PATH /home/alexandrefn/projects/frame-devs/managerUser/views/site/main/index.blade.php ENDPATH**/ ?>