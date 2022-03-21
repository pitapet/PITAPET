let container = document.getElementById("container");
const dogcat = document.querySelector(".dogcat");

toggle = () => {
  container.classList.toggle("sign-in");
  container.classList.toggle("sign-up");
};

setTimeout(() => {
  container.classList.add("sign-in");
}, 100);