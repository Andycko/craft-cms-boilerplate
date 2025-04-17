import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/dist/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

// check to make sure animation only plays on laptop+
// let mm = gsap.matchMedia();
// mm.add("(min-width: 991px)", () => {

    if (document.querySelector('.logoTextHeader')) {

        // const logoTextHero = gsap.timeline({defaults: { duration: 0.2}})
        // logoTextHero
        //     .fromTo('.header-logo', { scale: 1 }, { scale: 0.5 })
        //     .fromTo('.established', { opacity: 1 }, { opacity: 0 })
        //     .fromTo('.header-text', { opacity: 1 }, { opacity: 0 })

        // ScrollTrigger.create({
        //     animation: logoTextHero,
        //     trigger: '.logoTextHeader',
        //     start: "top top",
        //     end: "+=1500",
        //     scrub: true,
        //     pin: false
        // }) 

        const logoAnimation = gsap.timeline({defaults: { duration: 0.2}})
        logoAnimation
            .fromTo('.header-logo', { scale: 1, opacity: 1 }, { scale: 0.4, opacity: 0 })

        ScrollTrigger.create({
            animation: logoAnimation,
            trigger: '.logoTextHeader',
            start: "top top",
            end: "+=300",
            scrub: true,
            pin: false
        }) 

        const establishedAnimation = gsap.timeline({defaults: { duration: 0.2}})
        establishedAnimation
            .fromTo('.established', { opacity: 1 }, { opacity: 0})

        ScrollTrigger.create({
            animation: establishedAnimation,
            trigger: '.logoTextHeader',
            start: "top top",
            end: "+=200",
            scrub: true,
            pin: false
        }) 

        const textAnimation = gsap.timeline({defaults: { duration: 0.2}})
        textAnimation
            .fromTo('.header-text', { opacity: 1 }, { opacity: 0})

        ScrollTrigger.create({
            animation: textAnimation,
            trigger: '.logoTextHeader',
            start: "top top",
            end: "+=200",
            scrub: true,
            pin: false
        }) 

        const linksAnimation = gsap.timeline({defaults: { duration: 0.2}})
        linksAnimation
            .fromTo('.header-link', { opacity: 1 }, { opacity: 0})

        ScrollTrigger.create({
            animation: linksAnimation,
            trigger: '.logoTextHeader',
            start: "top top",
            end: "+=200",
            scrub: true,
            pin: false
        }) 

        const navAnimation = gsap.timeline({defaults: { duration: 0.2}})
        navAnimation
            .fromTo('#main-nav', { opacity: 0 }, { opacity: 1})

        ScrollTrigger.create({
            animation: navAnimation,
            trigger: '.header-logo',
            start: "top top",
            end: "+=100",
            scrub: true,
            pin: false
        }) 

    }

// });