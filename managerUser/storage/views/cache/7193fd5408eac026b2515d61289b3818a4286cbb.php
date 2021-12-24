<?php $__env->startSection("content"); ?>
    <div class="container border-danger" style="border: 10px dashed red; padding: 20px;">
        <h2 class="text-danger"><span class="text-white" style="height: auto;">Message: </span> <?php echo e($message ?? "Not get message error!"); ?></h2>
        <p class="text-info"><span class="text-white">Code: </span><?php echo e($code ?? "Not get code error!"); ?></p>
        <p class="text-info"><span class="text-white">File: </span><?php echo e($file ?? "Not get file error!"); ?></p>
        <p class="text-info"><span class="text-white">Line: </span><?php echo e($line ?? "Not get line error!"); ?></p>
        <label class="col-12">
            <textarea name="contentReport" class="col-12 form-control" rows="5"></textarea>
        </label>
        <a href="" class="btn btn-danger">Enviar</a>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make("errors.template.index", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/alexandrefn/projects/frame-devs/managerUser/views/errors/main/throwableDefault.blade.php ENDPATH**/ ?>