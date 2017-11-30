import "bootstrap";
import { initUpdateRentOnScroll } from '../rentmenu';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

import { loadDynamicBannerText } from '../components/banner';
initUpdateNavbarOnScroll();
if (document.querySelector('.rent-spaceship')){ initUpdateRentOnScroll();};
flatpickr(".datepicker", {});
loadDynamicBannerText();

import 'totalPrice';
