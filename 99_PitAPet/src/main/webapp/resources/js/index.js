$(document).ready(function () {
  $("#fullpage").fullpage({
    anchors: ["section1", "section2", "section3", "section4", "section5"],
    autoScrolling: true,
    // scrollHorizontally: true,
    sectionsColor: ["#f2f2f2", "#f2f2f2", "#f2f2f2", "#f2f2f2", "#f2f2f2"],
    navigation: true,
    slidesNavigation: true,
    continuousVertical: true,
    loopHorizontal: false,
    afterLoad: function (anchorLink, index) {
      console.log("Section No : " + index);
    },
    afterSlideLoad: function (anchorLink, index, slideAnchor, slideIndex) {
      console.log("Slide No : " + index);
    },
  });
});
