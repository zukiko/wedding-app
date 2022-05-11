$(document).ready(function () {
    // 写真クリック時の処理
    function imageClick(){

      // photo-mainを表示
      const el = document.getElementsByClassName("photo-main");
      // el[0].style.display = "flex";

      // 写真の情報を取得
      img    = $(this).find('.item-img img').attr('src');
      text   = $(this).find('.item-text')[0].innerText;
      user   = $(this).find('.item-name')[0].innerText;
      id     = $(this).find('.item-id')[0].innerText;
      userid = $(this).find('.item-userid')[0].innerText;

      $('.photo-main').fadeOut(400, function(){
        // クリックした写真を取得
        $('#photo-img img').attr('src', img).on('load', function(){
          $(this).fadeIn();
        })
        // クリックした写真のコメントを取得
        let photoTextElement = document.getElementById("photo-text");
        photoTextElement.textContent = text;

        // クリックした写真の投稿者を取得
        let photoNameElement = document.getElementById("photo-name");
        photoNameElement.textContent = user;

        // デリート対象のidを取得
        let deleteElement = document.getElementById("photo-delete");
        deleteElement.href = "/photos/" + id;

        // ログインidと投稿者idが同じ場合はデリートボタンを表示する
        if(gon.current_user_id == userid){
          // デリートアイコンを表示
          let deleteIcon = document.getElementsByClassName("delete-icon");
          deleteIcon[0].style.display = "block";
        }else{
          // デリートアイコンを非表示
          let deleteIcon = document.getElementsByClassName("delete-icon");
          deleteIcon[0].style.display = "none";
        }

        // 編集対象のidを取得
        let editElement = document.getElementById("photo-edit");
        editElement.href = "/photos/" + id +"/edit";

        // ログインidと投稿者idが同じ場合は編集ボタンを表示する
        if(gon.current_user_id == userid){
          // editアイコンを表示
          let editIcon = document.getElementsByClassName("edit-icon");
          editIcon[0].style.display = "block";
        }else{
          // editアイコンを非表示
          let editIcon = document.getElementsByClassName("edit-icon");
          editIcon[0].style.display = "none";
        }

        // クリックした写真の情報をフェードイン表示する
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
    items: 5, /*表示する項目*/
    margin: 5,
    loop: true,
    center: true,
    merge: true,
    autoWidth: false,
    startPosition: 3,
    rewind: true,
    dots: false
  });
});