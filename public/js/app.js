window.onload = () => {
  const nav_hamburger = document.querySelector('#mobile-navbar-toggle');
  const mobile_nav = document.querySelector('#mobile-navbar-links');
  nav_hamburger.onclick = () => {
    toggleClass(nav_hamburger, 'active');
    toggleClass(mobile_nav, 'active');
  };

  const toggleClass = (node, className) => {
      if (node.classList.contains(className)) node.classList.remove(className);
      else node.classList.add(className);
  }
};