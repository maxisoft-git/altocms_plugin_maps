<p><b>{$oField->getFieldName()}</b>:
	<div>
	<script src="http://api-maps.yandex.ru/2.0/?load=package.full&mode=release&lang=ru-RU" type="text/javascript"></script>
	{literal}
	<script type="text/javascript">
		ymaps.ready(function () {
			var myMap = new ymaps.Map("ItemMap", {

	{/literal}
				// Центр карты
				center: [55.76, 37.64],
				// Коэффициент масштабирования
				zoom: {$oConfig->getValue('plugin.maps.map_zoom')},
				// Тип карты
				type: "yandex#map"
	{literal}
			});

			myMap.controls.add("typeSelector").add("zoomControl");

			{/literal}{if $oField->getCoord($oTopic->getField($oField->getFieldId()),0) && $oField->getCoord($oTopic->getField($oField->getFieldId()),1)}{literal}
			myMap.setCenter([{/literal}{$oField->getCoord($oTopic->getField($oField->getFieldId()),0)}{literal}, {/literal}{$oField->getCoord($oTopic->getField($oField->getFieldId()),1)}{literal}]);
			{/literal}{/if}{literal}


			{/literal}
			{if $oField->getCoord($oTopic->getField($oField->getFieldId()),0) && $oField->getCoord($oTopic->getField($oField->getFieldId()),1)}
				{literal}

				myPlacemark = new ymaps.Placemark([{/literal}{$oField->getCoord($oTopic->getField($oField->getFieldId()),0)}{literal}, {/literal}{$oField->getCoord($oTopic->getField($oField->getFieldId()),1)}{literal}], {
				balloonContentHeader: '{/literal}{$oTopic->getTitle()|escape:'html'}{literal}',
				balloonContentBody: ''
				}, {
					// Опции
					preset: 'twirl#blueStretchyIcon' // иконка растягивается под контент
				});

				// Добавляем метку на карту
				myMap.geoObjects.add(myPlacemark);
				myPlacemark.balloon.open();


				{/literal}
			{/if}

			{literal}

		});
	</script>
	{/literal}

	<div id="ItemMap" style="width:{$oConfig->getValue('plugin.maps.map_width')};height:{$oConfig->getValue('plugin.maps.map_height')};"></div>

	</div>
</p>