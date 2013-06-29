var userLocation = new google.maps.LatLng(50.089952, 14.424090999999976);
	function initialize() {
  		var map = new google.maps.Map(document.getElementById('map-canvas'), {
    		mapTypeId: google.maps.MapTypeId.ROADMAP,
    		center: userLocation,
    		zoom: 15
  		});		//end var map					  			
  		var service = new google.maps.places.PlacesService(map);	
		var refs = ['CnRmAAAA8FlJiHRky3aLurG_t0UEObZHJLasq8LrTyGJ1iSYVhzwIiZ2vB88WJDN0MpTE46KOeF3RsRibVYVZAcOLQ9BZrCkSefRTa2SD4JnizQMuORM9xWTd3kO3y6TlqkBFKtCBUDW1FK4zu8oNkkPKc97PRIQtb72zw7RImgFEnTqYjnqIRoU6uPEnf9h42799JgWJiJylzP6RZE',
					'CnRkAAAAuiJBsxwEsUEm9qCCIWfE5A-EgYxEynh4gdLaXnKLmP1PI-OTFdLwo1JFIVYP2CQWEyaV3Rufy_eMf4VXwsfXnZeVd9VJQ14C8RTWbIctu1nvq31XdNHo-UzKjZWVkxwpbUknO-TZA_gAnXYjQ1g8OBIQC4Ze7Y3GrLuARe386Dz-6RoUiSMg284C3ytIe68XyfJKE1unIGw',
					'CnRkAAAAOgQiq2-pNd_eqm0qewQthlt1t-ns42ikVJdXDS_2vcFGaFa02jvXDmPGqeuEN1vWaqHZ4hIReUqg7sv5qZV2xF5v2uceV-jE1BSGKpRDX9HA1yg929ILaBhF4sPrzcG3sCUgkOXX4xQGrs9_fv1B-BIQ0djWyJSuq4MZbo2RXBlQthoUi3QH5xCFTLjgBY61jcLvrytwkxY',
					'CnRkAAAAkgsq93M4t1jwy7NSgtQSoID02tMSaABFuQUH8wlOUgoxZdEanN2k_8eHLovvUIHuPKLnZf4Tr_PgQMTgnXUfvZxHhx6q2VmSuz2M4Tii1Pi1ktgC6YB3UEwgRjmlj9t2xcldsp-6L6E392zczQRwuhIQl_RpPoLqq2XD6csQuNr_GxoUQXcuoatTOOZc-GjEV-9nvNcQjvc'];
		var request;
		var descrString="";
		var bounds = new google.maps.LatLngBounds();
//-------------------
		for(var i=0;i<refs.length;i++){
  			request = {reference: refs[i]};
  			service.getDetails(request, function(place, status) {
    			if (status == google.maps.places.PlacesServiceStatus.OK) {
					google.maps.event.addListenerOnce(map, 'idle', function(){
						map.setCenter(place.geometry.location);
      					var marker = new google.maps.Marker({map: map,position: place.geometry.location});
						bounds.extend(place.geometry.location);
						map.fitBounds(bounds);

						descrString += 
						"<div class='panel'>"+
							"<h3>"+place.name+"</h3>"+
							"<span>15/100 invites left</span>"+
							"<a href='#' class='button'>More info</a>"+
							"<a href='#' class='button'>Get invite</a>"+ 
							"<div class='panelcontent'>"+
							"<p>This panel is collapsed by default (until user sets a preference)</p>"+
							"</div>"+
						"</div>";
        				document.getElementById('place-container').innerHTML = descrString;		
				});
    		}
  		});
	}
}
google.maps.event.addDomListener(window, 'load', initialize);