$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        add: function (e, data) {
   
            if ((/\.(gif|jpg|jpeg|tiff|png)$/i).test(data.files[0].name)) {
                if (data.files && data.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#target').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(data.files[0]);
                    data.submit();
                }
            }

        },
        
        done: function (e, data) {
        	$("tr:has(td)").remove();
            $.each(data.result, function (index, file) {
            	
            	
                $("#uploaded-files").append(
                		$('<tr/>')
                		.append($('<td/>').text(file.fileName))
                		.append($('<td/>').text(file.fileSize))
                		.append($('<td/>').text(file.fileType))
                		.append($('<td/>').html("<a href='rest/controller/get/"+index+"'>Click</a>"))
                		)//end $("#uploaded-files").append()
            }); 
        },
        
        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
   		},
   		
		dropZone: $('#dropzone')
    });
});