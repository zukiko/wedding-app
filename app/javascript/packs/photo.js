$(document).ready(function () {
  $(".owl-carousel").owlCarousel({
    items: 3 /*表示する項目数 */ ,
    margin: 5,
    loop: true /* ドラッグで１周する／１枚目に戻る */ ,
    center: true,
    merge: true,
    autoWidth: false,
    startPosition: 3,
    rewind: true /* navボタンを押して元に戻る */ ,
    nav: true,
    // navText: ['前', '次'],
    // autoplay: true,
    autoplayTimeout: 1000,
    autoplayHoverPause: true,
    autoplaySpeed: 5000,
    navClass: ['owl-prev', 'owl-next'],
    navContainerClass: "owl-nav",
    navElement: 'div'
  });
});