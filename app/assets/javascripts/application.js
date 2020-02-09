// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require activestorage
//= require jquery.rateyo.min
//= require_tree .

// movie_indexに関して


// headerについて
$(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
 });

// topに戻るボタンについて
$(function() {
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });
});

// user_show tabについて
$(function() {
  $('#tab-contents .tab[id != "tab1"]').hide();

  $('#tab-menu a').on('click', function() {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    return false;
  });
});

// skipprについて
$(document).ready(function () {
  $("#theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'fade',
      // 変化に係る時間(ミリ秒)
      speed : 950,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : false,
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : true,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : false,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 3000,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : true,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
  });
});


$(function() {
  $('#tab-contents .tab[id != "tab1"]').hide();

  $('#tab-menu a').on('click', function() {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    return false;
  });
});

$(function() {
    //入力時のイベント
    $('.sample').on('input', function(){
        //文字数を取得
        var cnt = $(this).val().length;
        //現在の文字数を表示
        $('.now_cnt').text(cnt);
        if( 500 > cnt){
            //500文字以内の場合はボタンを有効化＆黒字
            $('.sample_btn').prop('disabled', false);
            $('.cnt_area').removeClass('cnt_danger');
        }else{
            //500文字を超える場合はボタンを無効化＆赤字
            $('.sample_btn').prop('disabled', true);
            $('.cnt_area').addClass('cnt_danger');
        }
    });

    //リロード時に初期文字列が入っていた時の対策
    $('.sample').trigger('input');

    //ボタンクリック時　実運用時はsubmit送信などを行うと思います
    $('.sample_btn').click(function(){
        alert('コメントは1人1つまで！');
    });
});