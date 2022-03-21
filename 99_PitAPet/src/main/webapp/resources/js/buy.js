$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

$(document).ready(() => {
		
		$(".btnDelete").click(function(){
			var no = $(this).attr('value');
			console.log(no);
			
			if(confirm("상품을 장바구니에서 삭제하시겠습니까?")) {
		    	location.replace("http://localhost:8088/pitapet/product/cart/delete?no=" + no);
		    }	
	    
	    });
	    
	    /*
	    $("#buyBtn").click(function(){
	    	var noArray = [];
	    	
	    	$('input[name=no]:checked').each(function(i){
	    		noArray.push($(this).attr('value'));
	    	});
	    	
	    	console.log(noArray);
	    	
	    	$.ajax({
	    		url: '../buy/check',
	    		type: 'GET',
	    		data : {
	    			cartNo : noArray
	    		},
	    		success:function(data){
	    			console.log("data : "+JSON.stringify(data));
	    		},
	    		error : function(request,status,error) {
	            	//console.log("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
	            	//alert($(request.responseText.replace(/(\r\n|\n|\r)/gm,"")).text());
	            	alert("처리에 실패하였습니다.\ncode:"+request.status+"\n"+"error:"+error);
		        }
	    	});
	    	
	    });
	    */
});