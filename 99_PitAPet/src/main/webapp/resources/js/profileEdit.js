$(() => {
  $("#fullpage").fullpage({
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
});

// let checked = document.querySelectorAll("#checks input[type='checkbox']:checked");
// console.log(checked);
// const result = document.querySelector(".charge");
// let charge = "";

// checked.each((i) => {
//   let tr = checked.parent().parent().eq(i);
//   let td = tr.children();
//   charge = td.eq(4).text();
//   console.log(charge);
//   result = charge;
// });

// function run() {
//   document.querySelectorAll(".main__user__body__table tbody").forEach((row, i) => {
//     if (row.querySelector("input[type=checkbox]").checked) {
//       console.log(`the first checkbox of row ${i} is checked`);
//     }
//   });
// }

// run();