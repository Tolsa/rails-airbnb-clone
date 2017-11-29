import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["1,5 million d'utilisateurs et plus de 49 000 vaisseaux", "Véhicules de particuliers à louer dans la galaxie"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
