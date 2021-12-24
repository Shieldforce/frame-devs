@extends("errors.template.index")

@section("content")
    <div class="container border-danger" style="border: 10px dashed red; padding: 20px;">
        <h2 class="text-danger"><span class="text-white" style="height: auto;">Message: </span> {{ $message ?? "Not get message error!" }}</h2>
        <p class="text-info"><span class="text-white">Code: </span>{{ $code ?? "Not get code error!" }}</p>
        <p class="text-info"><span class="text-white">File: </span>{{ $file ?? "Not get file error!" }}</p>
        <p class="text-info"><span class="text-white">Line: </span>{{ $line ?? "Not get line error!" }}</p>
        <label class="col-12">
            <textarea name="contentReport" class="col-12 form-control" rows="5"></textarea>
        </label>
        <a href="" class="btn btn-danger">Enviar</a>
    </div>
@endsection