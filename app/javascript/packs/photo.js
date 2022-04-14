$(document).ready(function () {

    // 写真クリック時の処理
    function imageClick(){
      // 写真の情報を取得
      img = $(this).find('.item-img img').attr('src');
      text = $(this).find('.item-text')[0].innerText;
      user = $(this).find('.item-name')[0].innerText;

      // クリックした写真をフェードイン表示
      $('#photo-img img').fadeOut(400, function(){
        $('#photo-img img').attr('src', img).on('load', function(){
          $(this).fadeIn();
        })
      })
      // クリックした写真のコメントをフェードイン表示
      $('#photo-text').fadeOut(400, function(){
        let textElement = document.getElementById("photo-text");
        textElement.textContent = text;
        $(this).fadeIn();
      })
      // クリックした写真の投稿者をフェードイン表示
      $('#photo-name').fadeOut(400, function(){
        let textElement = document.getElementById("photo-name");
        textElement.textContent = user;
        $(this).fadeIn();
      })
    }

    // ページ内の'photo-items'を全て取得
    const el = document.getElementsByClassName('photo-items');

    // 全ての'photo-items'にクリックイベントを付与
    for(let i = 0; i < el.length; i++) {
      // imageClick()で実処理
      el[i].addEventListener('click', imageClick, false);
    }

  $(".owl-carousel").owlCarousel({
    //表示する項目
    items: 4,
    margin: 5,
    loop: true,
    center: true,
    merge: true,
    autoWidth: false,
    startPosition: 3,
    rewind: true,
    dots: false,
    // nav: true,
    // navText: ['前', '次'],
    // autoplay: true,
    // autoplayTimeout: 1000,
    // autoplayHoverPause: true,
    // autoplaySpeed: 5000,
    // navClass: ['owl-prev', 'owl-next'],
    // navContainerClass: "owl-nav",
    // navElement: 'div'
  });
});