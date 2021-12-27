<form action="/create-user" method="POST">
    <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
    <label class="col-12">
        <input type="text" name="name" class="col-12 form-control" autofocus/>
        <input type="number" name="age" class="col-12 form-control"/>
    </label>
    <button type="submit" class="btn btn-danger">Enviar</button>
</form>
<hr>
<hr>
<hr>
<form action="/edit-user/10" method="POST">
    <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
    <label class="col-12">
        <input type="text" name="name" class="col-12 form-control" autofocus/>
        <input type="number" name="age" class="col-12 form-control"/>
    </label>
    <button type="submit" class="btn btn-danger">Enviar</button>
</form><?php /**PATH /home/alexandrefn/projects/frame-devs/managerUser/views/site/main/index.blade.php ENDPATH**/ ?>