function round(value, precision) {
	if (Number.isInteger(precision)) {
	  var shift = Math.pow(10, precision);
	  return Math.round(value * shift) / shift;
	} else {
	  return Math.round(value);
	}
} 

window.addEventListener('message', function (event) {
    var item = event.data;
	
		
    if (item.clear == true) {
        $(".items").empty();
    }
    if (item !== undefined && item.display == true) {
		
		var xhr = new XMLHttpRequest();
		xhr.responseType = "text";
		xhr.open('GET', event.data.steamid, true);
		xhr.send();
		xhr.onreadystatechange = processRequest;
		function processRequest(e) {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var string = xhr.responseText.toString();
				var array = string.split("avatarfull");
				var array2 = array[1].toString().split('"');
				$('#avatar').attr('src', array2[2].toString());
			}
		}
		
		$('#playerid').text(event.data.playerid);
		$('#hovaten').text(event.data.name);
		$('#gioitinh').text(event.data.sex);
		$('#chieucao').text(event.data.height);
		$('#ngaysinh').text(event.data.dateofbirth);
		$('#congviec').text(event.data.job);
		$('#sodienthoai').text(event.data.phone_number);
		$('#sotienmat').text(event.data.money);
		$('#nganhang').text(event.data.bank);
		$('#sotienban').text(event.data.black_money);
		
        $(".container").fadeIn(100);
		return;
    }
    if (item.display == false) {
        $(".container").fadeOut(100);
    }
});

document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});
