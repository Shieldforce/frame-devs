<?php $__env->startSection("content"); ?>
    <div class="container border-danger" style="border: 10px dashed red; padding: 20px;">
        <p class="text-danger"><span class="text-white" style="height: auto; width: auto;" title="<?php echo e($message ?? "Not get message error!"); ?>">
            Message: </span>
            <?php echo e(isset($message) ? $message : "Not get message error!"); ?>

        </p>
        <p class="text-info"><span class="text-white">Code: </span><?php echo e($code ?? "Not get code error!"); ?></p>
        <p class="text-info"><span class="text-white">File: </span><?php echo e($file ?? "Not get file error!"); ?></p>
        <p class="text-info"><span class="text-white">Line: </span><?php echo e($line ?? "Not get line error!"); ?></p>
        <form action="/" method="POST">
            <label class="col-12">
                <textarea name="contentReport" class="col-12 form-control" rows="5" autofocus></textarea>
            </label>
            <button type="submit" class="btn btn-danger">Enviar</button>
        </form>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make("errors.template.index", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/alexandrefn/projects/frame-devs/mvc/views/errors/main/throwableDefault.blade.php ENDPATH**/ ?>