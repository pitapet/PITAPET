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
  
});


