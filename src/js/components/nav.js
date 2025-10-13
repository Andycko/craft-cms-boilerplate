export function initNavigation() {

  // --- Helpers ---
  const setMaxHeightToScroll = (el) => { el.style.maxHeight = el.scrollHeight + 'vh'; };
  const closeMaxHeight = (el) => { el.style.maxHeight = '0px'; };

  // --- Mobile panel toggling ---
  const btn = document.getElementById('menu-btn');
  const menu = document.getElementById('mobile-menu');
  const topMenu = document.getElementById('top-menu');
  const [topLine, midLine, botLine] = btn.querySelectorAll('.line');

  btn.addEventListener('click', () => {
    const isOpen = btn.getAttribute('aria-expanded') === 'true';
    btn.setAttribute('aria-expanded', String(!isOpen));

    // Icon animation
    topLine.classList.toggle('top-rotate');
    midLine.classList.toggle('mid-fade');
    botLine.classList.toggle('bot-rotate');


    if (isOpen) {
      closeMaxHeight(menu);
      document.body.classList.remove('overflow-hidden'); // enable scroll
      topMenu.classList.remove('hidden'); // hides top menu

    } else {
      setMaxHeightToScroll(menu);
      document.body.classList.add('overflow-hidden'); // disable scroll
      topMenu.classList.add('hidden'); // hides top menu
    }

    // Slide panel
    if (isOpen) {
      closeMaxHeight(menu);
      // Also close any open submenus
      document.querySelectorAll('[data-accordion-panel]').forEach(p => closePanel(p));
    } else {
      setMaxHeightToScroll(menu);
    }
  });

  // --- Accordion (mobile submenus) ---
  const triggers = document.querySelectorAll('[data-accordion-trigger]');

  function openPanel(panel, trigger, chev) {
    setMaxHeightToScroll(panel);
    trigger.setAttribute('aria-expanded', 'true');
    chev?.classList.add('chev-rot');
  }
  function closePanel(panel, trigger, chev) {
    closeMaxHeight(panel);
    trigger?.setAttribute('aria-expanded', 'false');
    chev?.classList.remove('chev-rot');
  }

  // Optional: only one submenu open at a time
  const SINGLE_OPEN = false;

  triggers.forEach(trigger => {
    const panelId = trigger.getAttribute('aria-controls');
    const panel = document.getElementById(panelId);
    const chev = trigger.querySelector('.chev');

    // Click / keyboard activation
    const activate = (ev) => {
      // Allow Space/Enter when button is focused
      if (ev.type === 'keydown' && !(ev.key === 'Enter' || ev.key === ' ')) return;
      ev.preventDefault();

      const isOpen = trigger.getAttribute('aria-expanded') === 'true';

      if (SINGLE_OPEN && !isOpen) {
        // Close others
        triggers.forEach(t => {
          if (t !== trigger) {
            const pid = t.getAttribute('aria-controls');
            const p = document.getElementById(pid);
            const c = t.querySelector('.chev');
            closePanel(p, t, c);
          }
        });
      }

      isOpen ? closePanel(panel, trigger, chev) : openPanel(panel, trigger, chev);

      // Ensure parent menu container grows/shrinks to fit
      setMaxHeightToScroll(menu);
    };

    trigger.addEventListener('click', activate);
    trigger.addEventListener('keydown', activate);
  });

 
  // Parent link toggles (accordion)
  const parents = document.querySelectorAll('.parent-link');
  parents.forEach(link => {
    const submenuId = link.getAttribute('aria-controls');
    const submenu = document.getElementById(submenuId);
    const chev = link.querySelector('.chev');

    link.addEventListener('click', (e) => {
      const expanded = link.getAttribute('aria-expanded') === 'true';

      if (!expanded) {
        e.preventDefault(); // stop navigation on first click

        // Close other open dropdowns
        parents.forEach(other => {
          if (other !== link) {
            const otherId = other.getAttribute('aria-controls');
            const otherSub = document.getElementById(otherId);
            const otherChev = other.querySelector('.chev');
            other.setAttribute('aria-expanded', 'false');
            closeMaxHeight(otherSub);
            otherChev.classList.remove('chev-rot');
          }
        });

        // Open this one
        link.setAttribute('aria-expanded', 'true');
        submenu.style.maxHeight = submenu.scrollHeight + 'px';
        chev.classList.add('chev-rot');
        setMaxHeightToScroll(menu);
      } else {
        // Already open -> second click will navigate
        link.setAttribute('aria-expanded', 'false');
      }
    });
  });
}