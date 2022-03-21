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
});