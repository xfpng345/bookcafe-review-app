$(function() {
  
  $('.tokyo').hide();
  $('.osaka').hide();
  $('.nagoya').hide();

  $('#shop_prefecture_code').change(function() {
    var val = $(this).val();
    Number(val)
    if (val == 13) {
      $('.tokyo').show();
      $('.osaka').remove();
      $('.nagoya').remove();
    }
    else if (val == 27) {
      $('.osaka').show();
      $('.tokyo').remove();
      $('.nagoya').remove();
    }
    else if (val == 23) {
      $('.nagoya').show();
      $('.tokyo').remove();
      $('.osaka').remove();
    }
    else{
      $('.tokyo').hide();
      $('.osaka').hide();
      $('.nagoya').hide();
    }
  });
});