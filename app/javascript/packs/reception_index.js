$(document).ready(function () {

  $(".owl-carousel").owlCarousel({
    items: 4, /*表示する項目*/
    margin: 0,
    loop: true,
    // center: true,
    // merge: true,
    // autoWidth: false,
    // startPosition: 3,
    // rewind: true,
    // dots: false,
    // nav: true,
    // navText: ['前', '次'],
    autoplay: true,
    // autoplayTimeout: 1000,
    // autoplayHoverPause: true,
    autoplaySpeed: 8000
    // navClass: ['owl-prev', 'owl-next'],
    // navContainerClass: "owl-nav",
    // navElement: 'div'
  });
});