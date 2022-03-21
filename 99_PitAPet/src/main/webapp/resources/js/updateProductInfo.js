$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

$(document).ready(() => {
	  $("#btnClose").on("click", function(){ 
        window.close(); 
      }); 
});
