const initUpdateSearch = () => {
  document.addEventListener('DOMContentLoaded', (event) => {
    event.preventDefault();
    const searchmenu = document.querySelector(".content-search");
    console.log(searchmenu);
    searchmenu.classList.remove('content-search');
    searchmenu.classList.add('content-search-active');
  });
}

export { initUpdateSearch };
