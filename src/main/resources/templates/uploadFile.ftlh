<script src="/static/js/jquery.min.js"></script>
<script>
    function sendFile() {
        var formData = new FormData();
        var files = ($('#file'))[0]['files'];
        [].forEach.call(files, function (file, i, files) {
            formData.append("file", file);
        });

        $.ajax({
            type: "POST",
            url: "/files",
            data: formData,
            processData: false,
            contentType: false
        })

            .done(function (response) {
                var fileUrl = 'http://localhost/files/' + response;
                $('#photo').append('<img src = "' + fileUrl + '"/>');
            })
            .fail(function () {
                alert('Error')
            });
    }
</script>
<div>
    <input type="file" id="file" name="file" placeholder="Имя файла..."/>

    <button onclick="sendFile()">
        Загрузить файл
    </button>

    <input type="hidden" id="file_hidden">
    <div class="filename"></div>
</div>
