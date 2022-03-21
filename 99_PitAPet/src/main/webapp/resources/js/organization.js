$(() => {
  $("#fullpage").fullpage({
    navigation: true,
    normalScrollElements: [".organizationList", "#map"],
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});




