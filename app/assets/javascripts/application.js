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
//= require turbolinks
//= require_tree .

$('.list-head').click(function() {
    var $answer = $(this).parent().find('.answer');
    if($answer.hasClass('open')) { 
      $answer.removeClass('open');
      // slideUpメソッドを用いて、$answerを隠す
      $answer.slideUp();

      // 子要素のspanタグの中身をtextメソッドを用いて書き換える
      $(this).find('.list-icon').text('+');
      
    } else {
      $answer.addClass('open'); 
      // slideDownメソッドを用いて、$answerを表示する
      $answer.slideDown();
      
      // 子要素のspanタグの中身をtextメソッドを用いて書き換える
      $(this).find('.list-icon').text('-');
      
    }
  });
