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
//= require activestorage
//= require jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require jquery.jpostal

// $(function(){
// 	$('.jquery').on('click',function(){
// 		$(this).css('color','red');
// 	});
// });

// var xhr = new XMLHttpRequest();

// xhr.open('GET', '/');
// xhr.send();

// xhr.onreadystatechange = function(){

// 	if (xhr.readyState === 4 && xhr.status === 200) {
// 		console.log(xhr.responseText);
// 	}

// }

function initMap(){
	  let geocoder = new google.maps.Geocoder()
	  let map = new google.maps.Map(document.getElementById('map'), {
	  center: {lat: -34.397, lng: 150.644},
	  zoom: 8
	  });
	  let indicator = $('#map').attr('class');
	  geocoder.geocode( { 'address': indicator }, function(results, status) {
			    if (status == 'OK') {
			　　　　　　　　　　　　// map.setCenterで地図が移動
			      map.setCenter(results[0].geometry.location);
			　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
			      var marker = new google.maps.Marker({
			          map: map,
			          position: results[0].geometry.location
			      });
			    } else {
			      alert('Geocode was not successful for the following reason: ' + status);
			    }
			  });
	}