/*
document.cookie = "safeCookie1foo; SameSite=Lax";
document.cookie = "safeCookie1foo";
document.cookie = "crossCookie=bar; SameSite=None; Secure";
*/

$(() => {
  $("#fullpage").fullpage({
    navigation: true,
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    }, 
  });

  $('.bxslider').bxSlider({
    auto: true,
    speed: 500,
    pause: 5000,
    mode: 'horizontal',
    controls: false,
    pager: false,
    slideWidth: '800px',
  });
  
  /*
  $("#btnCart").click(function(){
    	var no = $("#selectProductInfo option:selected").val();
    	console.log(no);
    	var count = $('input[name=count]').val();
	    console.log(count);
    	
	    location.replace("http://localhost:8088/pitapet/product/cart/add?no=" + no + "&count=" + count);
    });
  */
});


