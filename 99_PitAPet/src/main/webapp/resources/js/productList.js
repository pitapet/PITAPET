$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

$(document).ready(() => {
		$("#btnAddProduct").on("click", () => {
			const url = "http://localhost:8088/pitapet/product/add/product";
			const status = "left=300px,top=200px,width=1200px,height=500px";
			
			open(url, "", status);
		});
		
		$(".btnDelete").click(function(){
			var no = $(this).attr('value');
			console.log(no);
			
			if(confirm("상품을 삭제하시겠습니까?")) {
		    	location.replace("http://localhost:8088/pitapet/product/delete/product?no=" + no);
		    }	
	    
	    });
	    
	    $(".btnUpdate").click(function(){
			var no = $(this).attr('value');
			console.log(no);
			
			const url = "http://localhost:8088/pitapet/product/update/product?no=";
			const status = "left=300px,top=200px,width=1200px,height=500px";
					
			window.open(url + no, "", status);	
	    
	    });

});
