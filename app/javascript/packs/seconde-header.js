const { on } = require("events")

$(function(){
  $('.toggle-btn').on('click',function(){

    //#headerにopenクラスが存在(hasClass)するとき
    if($('#header').hasClass('open')) {
      //openクラスを削除してメニューを非表示にする
      $('#header').removeClass('open');

    }else {
      //openクラスを追加してメニューを表示する
      $('#header').addClass('open');
    }

  });

  $('#mask').on('click',function(){
    //openクラスを削除してメニューを非表示にする
    $('#header').removeClass('open');
  });
});