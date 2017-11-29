import "bootstrap";
import { initUpdateRentOnScroll } from '../rentmenu';
if (document.querySelector('.rent-spaceship')){ initUpdateRentOnScroll();};

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

flatpickr(".datepicker", {

});
