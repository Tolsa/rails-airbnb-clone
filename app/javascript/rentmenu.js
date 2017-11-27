function initUpdateRentOnScroll() {
  const rentmenu = document.querySelector(".rent-spaceship");
  console.log(rentmenu);
  window.addEventListener('scroll', (event) => {
    if (window.scrollY >= 120) {
      console.log (window.scrollY)
      console.log(rentmenu);
      rentmenu.classList.remove('rent-spaceship');
      rentmenu.classList.add('rent-spaceship-scroll');
    } else {
      rentmenu.classList.remove('rent-spaceship-scroll');
      rentmenu.classList.add('rent-spaceship');
    }
  });
}

export { initUpdateRentOnScroll };
