@extends("errors.template.index")

@section("content")
    <div class="container border-danger" style="border: 10px dashed red; padding: 20px;">
        <p class="text-danger"><span class="text-white" style="height: auto; width: auto;" title="{{ $message ?? "Not get message error!" }}">
            Message: </span>
            {{ isset($message) ? $message : "Not get message error!" }}
        </p>
        <p class="text-info"><span class="text-white">Code: </span>{{ $code ?? "Not get code error!" }}</p>
        <p class="text-info"><span class="text-white">File: </span>{{ $file ?? "Not get file error!" }}</p>
        <p class="text-info"><span class="text-white">Line: </span>{{ $line ?? "Not get line error!" }}</p>
        <form action="/" method="POST">
            <label class="col-12">
                <textarea name="contentReport" class="col-12 form-control" rows="5" autofocus></textarea>
            </label>
            <button type="submit" class="btn btn-danger">Enviar</button>
        </form>
    </div>
@endsection