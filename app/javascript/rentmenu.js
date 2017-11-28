function initUpdateRentOnScroll() {
  const rentmenu = document.querySelector(".rent-spaceship");
  window.addEventListener('scroll', (event) => {
    if (window.scrollY >= 120) {
      rentmenu.classList.remove('rent-spaceship');
      rentmenu.classList.add('rent-spaceship-scroll');
    } else {
      rentmenu.classList.remove('rent-spaceship-scroll');
      rentmenu.classList.add('rent-spaceship');
    }
  });
}

export { initUpdateRentOnScroll };
