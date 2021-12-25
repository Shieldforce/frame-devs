<form action="/" method="POST">
    <input type="hidden" name="_method" value="delete">
    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <label class="col-12">
        <textarea name="contentReport" class="col-12 form-control" rows="5" autofocus></textarea>
    </label>
    <button type="submit" class="btn btn-danger">Enviar</button>
</form>