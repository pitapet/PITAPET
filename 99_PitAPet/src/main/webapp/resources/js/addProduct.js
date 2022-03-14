$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

$(document).ready(() => {
	  $("#addProduct").on("click", function(){
	  	alert("상품 카테고리가 추가되었습니다.");
	  	$('#addProductFrm').submit();
	  	
	  	setTimeout(function(){
	  		window.close();
	  	}, 100);
	  });
	  
	  $("#btnClose").on("click", function(){ 
        window.close(); 
    }); 
});
