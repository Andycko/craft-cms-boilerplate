
export function initAccordionImage() {
 const options = document.querySelectorAll('[data-img]');
    const displayImage = document.getElementById('displayImage');

    options.forEach(option => {
      option.addEventListener('click', () => { 
        // update image
        displayImage.src = option.getAttribute('data-img');
      });
    });
}