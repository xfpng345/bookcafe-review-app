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