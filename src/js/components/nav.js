import $ from 'jquery';

/**
 * Finds a topmost parent element with a selector provided of the provided element
 * @param {Node} element
 * @param {string} selector
 * @returns {Node}
 */
const findTopParentWithSelector = (element, selector) => {
    let parent = element
    while (parent.parentElement.closest(selector))
        parent = parent.parentElement.closest(selector)
    return parent
}

/**
 * Check if an element is out of the viewport
 * (c) 2018 Chris Ferdinandi, MIT License, https://gomakethings.com
 * @param  {Node}  elem The element to check
 * @return {Object}     A set of booleans for each side of the element
 */
const isOutOfViewport = function (elem) {
    // Get element's bounding
    const bounding = elem.getBoundingClientRect();
    // Check if it's out of the viewport on each side
    const out = {};
    out.top = bounding.top < 0;
    out.left = bounding.left < 0;
    out.bottom = bounding.bottom > (window.innerHeight || document.documentElement.clientHeight);
    out.right = bounding.right > (window.innerWidth || document.documentElement.clientWidth);
    out.any = out.top || out.left || out.bottom || out.right;
    out.all = out.top && out.left && out.bottom && out.right;

    return out;
};

$(function () {
    const nav_hamburger = document.querySelector('#mobile-navbar-toggle');
    const mobile_nav = document.querySelector('#mobile-navbar-links');
    nav_hamburger.onclick = () => {
        nav_hamburger.classList.toggle('is-active');
        mobile_nav.classList.toggle('active');
        document.querySelector('html').classList.toggle('no-scroll')
    };

    // check dropdowns out of bounds
    const dropdowns = document.querySelectorAll('.sub-menu')
    dropdowns.forEach((el) => {
        if (isOutOfViewport(el).any)
            findTopParentWithSelector(el, '.sub-menu').classList.add('left')
    })

    const mobile_dropdowns = document.querySelectorAll('.mobile-navbar-links .item.parent')
    mobile_dropdowns.forEach((el) => {
        const btn = el.querySelector('button')
        const submenu = el.querySelector('.sub-menu')
        btn.onclick = () => {
            submenu.classList.toggle('active')
            btn.classList.toggle('active')
        }
    })

});
