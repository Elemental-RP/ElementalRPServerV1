$(document).ready(function(){
   // Listen for NUI Events
  window.addEventListener('message', function(event){
    var item = event.data;
    // Trigger adding a new message to the log and create its display
    if (item.open === 2) {
     // console.log(3)
     // update(item.info);

      if (item.direction) {
        $(".direction").find(".image").attr('style', 'transform: translate3d(' + item.direction + 'px, 0px, 0px)');
        return;
      }
      $(".vehicle").removeClass("hide");
      $(".wrap").removeClass("lower");
      $(".time").removeClass("timelower");

      $(".fuelamount").empty();
      $(".fuelamount").append(item.fuel);

      $(".speedamount").empty();
      $(".speedamount").append(item.mph);

      $(".street-txt").empty();
      $(".street-txt").append(item.street);
      
      $(".time").empty();
      $(".time").append(item.time); 
    }

    if (item.open === 4) {
      $(".vehicle").addClass("hide");
      $(".wrap").addClass("lower");
      $(".time").addClass("timelower");
      $(".fuelamount").empty();
      $(".speedamount").empty();
      $(".street-txt").empty();

      $(".time").empty();
      $(".time").append(item.time); 
      $(".direction").find(".image").attr('style', 'transform: translate3d(' + item.direction + 'px, 0px, 0px)');
    }

    if (item.open === 3) {
      $(".full-screen").fadeOut(100);    
    }    
    if (item.open === 1) {
      //console.log(1)
      $(".full-screen").fadeIn(100);    
    }    
  });
});