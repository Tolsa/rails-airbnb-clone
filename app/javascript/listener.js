const btn = document.getElementById("hover-sound");
const audio = new Audio(btn.dataset.soundUrl);

btn.addEventListener("mouseover", (event) => {
  console.log('ECOUTE')
  audio.play();
});
