$(document).ready(function(){
  // Client listener
  window.addEventListener('message', function(event) {
      if (event.data.action == 'open') {
        var data = event.data.array;
        $('#lastname').text(data.lastname);
        $('#firstname').text(data.firstname);
        $('#sex').text(data.sex.toUpperCase());
        $('#height').text(data.height);
        var pNumb =  data.dateofbirth.substring(0,4) + data.dateofbirth.substring(4,8) + data.dateofbirth.substring(8,12);
        $('#personnummer').text(pNumb);
        $('body').show();
      } else if (event.data.action == 'close') {
        $('body').hide();
      }
  });
});
