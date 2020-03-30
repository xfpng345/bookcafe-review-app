$(function(){
  $('#file').change(function(){
      $('img').remove();
      var file = $(this).prop('files')[0];
      if(!file.type.match('image.*')){
          return;
      }
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
          $('#result').html('<img class="upload" style="width: 200px;height: 200px;border-radius: 50%;object-fit: cover;" src="' + fileReader.result + '"/>');
      }
      fileReader.readAsDataURL(file);
  });
});

$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#user_img").change(function(){
      readURL(this);
  });
});
$(document).ready(function(){
  $('select').formSelect();
});
