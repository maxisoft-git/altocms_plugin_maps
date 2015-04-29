<p><b>{$oField->getFieldName()}</b>:

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
		$(function() {
			var myOptions = {
			zoom: {$oConfig->getValue('plugin.maps.map_zoom')},
			center: new google.maps.LatLng({$oField->getCoord($oTopic->getField($oField->getFieldId()),0)},{$oField->getCoord($oTopic->getField($oField->getFieldId()),1)}),
			panControl: true,
			zoomControl: true,
			scaleControl: true,
			mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById("gmap"),myOptions);

			{if $oField->getCoord($oTopic->getField($oField->getFieldId()),0) && $oField->getCoord($oTopic->getField($oField->getFieldId()),1)}
				var myLatlng = new google.maps.LatLng({$oField->getCoord($oTopic->getField($oField->getFieldId()),0)},{$oField->getCoord($oTopic->getField($oField->getFieldId()),1)});
				var contentString = "<b>{$oTopic->getTitle()|escape:"html"}</b> ";
				var infowindow = new google.maps.InfoWindow({
					content: contentString,
					maxWidth: 400,
				});

				var marker = new google.maps.Marker({
					position: myLatlng,
					map: map,
					title: '{$oTopic->getTitle()|escape:"html"}'
				});
				//infowindow.open(map,marker);
			{/if}

		});

	</script>

	<div id="gmap" style="width:{$oConfig->getValue('plugin.maps.map_width')};height:{$oConfig->getValue('plugin.maps.map_height')};"></div>
</p>