import "bootstrap";
import { initUpdateRentOnScroll } from '../rentmenu';
if (document.querySelector('.rent-spaceship')){ initUpdateRentOnScroll();};

import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

flatpickr(".datepicker", {

});
