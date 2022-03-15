import $ from 'jquery';

$(function () {
    const nav_hamburger = document.querySelector('#mobile-navbar-toggle');
    const mobile_nav = document.querySelector('#mobile-navbar-links');
    nav_hamburger.onclick = () => {
        nav_hamburger.classList.toggle('is-active');
        mobile_nav.classList.toggle('active');
        document.querySelector('html').classList.toggle('no-scroll')
    };
});
