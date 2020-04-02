$(function(){
  var nowchecked = $('input[name="q[wifi_eq]"]:checked').val();
  $('input[name="q[wifi_eq]"]').click(function(){
      if($(this).val() == nowchecked) {
          $(this).prop('checked', false);
          nowchecked = false;
      } else {
          nowchecked = $(this).val();
      }
  });
});

$(function(){
  var nowchecked = $('input[name="q[power_eq]"]:checked').val();
  $('input[name="q[power_eq]"]').click(function(){
      if($(this).val() == nowchecked) {
          $(this).prop('checked', false);
          nowchecked = false;
      } else {
          nowchecked = $(this).val();
      }
  });
});

$(function(){
  var nowchecked = $('input[name="shop[wifi]"]:checked').val();
  $('input[name="shop[wifi]"]').click(function(){
      if($(this).val() == nowchecked) {
          $(this).prop('checked', false);
          nowchecked = false;
      } else {
          nowchecked = $(this).val();
      }
  });
});

$(function(){
  var nowchecked = $('input[name="shop[power]"]:checked').val();
  $('input[name="shop[power]"]').click(function(){
      if($(this).val() == nowchecked) {
          $(this).prop('checked', false);
          nowchecked = false;
      } else {
          nowchecked = $(this).val();
      }
  });
});