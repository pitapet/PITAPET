/*
$(document).ready(() => {
	$('#price').change(() => {
        let price = $('#price').val();
        console.log(price);
        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#price').val(price);
    });
});
*/

$(document).ready(() => {
	$("#addProduct").on("click", () => {
		let title = $("#newTitle").val().trim();
		
		$.ajax({
			type: "post",
			url: "http://localhost:8088/product/checkTitle",
			dataType: "json",
			data: {
				title
			},
			success: (data) => {
				console.log(data);
				if(data > 0){
					var answer = confirm("이미 존재하는 상품입니다. 수정하시겠습니까?");
					
					if(answer){
						location = "http://localhost:8088/product/add";
					} else {
						history.back();
					}
				} else {
					location = "http://localhost:8088/product/update";
				}
			},
			error: (error) => {
				console.log(error);
			}
		});
	}); 
});

