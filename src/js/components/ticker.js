
export function initTicker() {
    const lane = document.getElementById('lane');
    const laneClone = document.getElementById('laneClone');
    const track = document.getElementById('track');
    const tickerRoot = document.getElementById('tickerRoot');

    // Clone content for looping
    laneClone.innerHTML = lane.innerHTML;

    // Animation state
    let lastTime = null;
    let x = 0;
    const speed = 40; // px/s
    let paused = false;

    function step(timestamp) {
        if (lastTime === null) lastTime = timestamp;
        const dt = (timestamp - lastTime) / 1000;
        lastTime = timestamp;
        if (!paused) {
            x -= speed * dt;
            const laneWidth = lane.offsetWidth;
            if (-x >= laneWidth) x += laneWidth;
            track.style.transform = `translateX(${x}px)`;
        }
        requestAnimationFrame(step);
    }
    requestAnimationFrame(step);

    // Pause on hover
    tickerRoot.addEventListener('mouseenter', () => paused = true);
    tickerRoot.addEventListener('mouseleave', () => paused = false);
}