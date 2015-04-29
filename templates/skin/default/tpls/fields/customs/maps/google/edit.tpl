<p><label for="item_map">{$aLang.plugin.maps.map}:</label>
{$field_id=$oField->getFieldId()}
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
function setCoordinates(lat,lng) {
	$('#lat').val(lat);
	$('#lng').val(lng);
}
var markersArray = [];
$(function() {
		var myOptions = {
		zoom: {$oConfig->getValue('plugin.maps.map_zoom')},
		center: new google.maps.LatLng({$oConfig->getValue('plugin.maps.map_center')}),
		panControl: true,
		zoomControl: true,
		scaleControl: true,
		mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById("gmap"),myOptions);


		{if $_aRequest.coord[$field_id][1] != ''}
			var myLatlng = new google.maps.LatLng({$_aRequest.coord[$field_id][0]},{$_aRequest.coord[$field_id][1]});
			var marker = new google.maps.Marker({
				position: myLatlng,
				map: map
			});
			markersArray.push(marker);
			map.setCenter(myLatlng);
		{/if}
		google.maps.event.addListener(map, 'click', function(event) {
			if (markersArray) {
				for (i in markersArray) {
				markersArray[i].setMap(null);
				}
				markersArray.length = 0;
			}
			var myLatlng = new google.maps.LatLng(event.latLng);
			var marker = new google.maps.Marker({
				position: event.latLng,
				map: map
			});
			markersArray.push(marker);
			setCoordinates(event.latLng.lat(),event.latLng.lng());
		});

	});
</script>

<div id="gmap" style="width:{$oConfig->getValue('plugin.maps.map_width')};height:{$oConfig->getValue('plugin.maps.map_height')};"></div>
<input type="hidden" id="lat" name="fields[{$field_id}][0]" value="{$_aRequest.coord[$field_id][0]}"/>
<input type="hidden" id="lng" name="fields[{$field_id}][1]" value="{$_aRequest.coord[$field_id][1]}"/>
</p>
