import { CountUp } from 'countup.js'; 

export function initStats() {

  // Respect reduced motion: show final values immediately
  const reduceMotion = window.matchMedia &&
    window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  // Optional compact formatter (K/M/B) for display only
  const compactFmt = new Intl.NumberFormat(undefined, { notation: "compact", maximumFractionDigits: 1 });

  function startCounter(el) {
    const end = parseFloat(el.dataset.end ?? "0");
    const duration = parseInt(el.dataset.duration ?? "1200", 10);
    const decimals = parseInt(el.dataset.decimals ?? "0", 10);
    const prefix = el.dataset.prefix ?? "";
    const suffix = el.dataset.suffix ?? "";
    const compact = el.dataset.compact === "true";

    if (reduceMotion) {
      // Jump to end value without animation
      const instant = compact ? compactFmt.format(end) : end.toLocaleString(undefined, { maximumFractionDigits: decimals });
      el.textContent = `${prefix}${instant}${suffix}`;
      return;
    }

    // Use CountUp; when using compact, we animate to the raw number
    const options = {
      duration: duration / 1000,
      decimalPlaces: decimals,
      prefix,
      suffix,
      // Use a custom formattingFn to support compact notation
      formattingFn:
        compact
          ? (n) => `${prefix}${compactFmt.format(n)}${suffix}`
          : undefined,
    };

    const counter = new CountUp(el, end, options);
    if (!counter.error) counter.start();
    else console.error(counter.error);
  }

  // Observe counters as they scroll into view
  const counters = document.querySelectorAll("[data-counter]");
  const seen = new WeakSet();

  if ("IntersectionObserver" in window) {
    const io = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting && !seen.has(entry.target)) {
          seen.add(entry.target);
          startCounter(entry.target);
        }
      });
    }, { threshold: 0.4 });

    counters.forEach((el) => io.observe(el));
  } else {
    // Fallback: start all on load
    counters.forEach(startCounter);
  }

}