$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

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
	  $("#title").on("change", function(){
	    var no = $(this).val();
	    console.log(no);
	    
	    $('input[name=productNo]').attr('value',no);
	    var no2 = $('input[name=productNo]').val();
	    console.log(no2);
	  });
	  
	  $("#btnClose").on("click", function(){ 
        window.close(); 
      }); 
      
      
});
