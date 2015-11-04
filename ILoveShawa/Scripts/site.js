ymaps.ready(initMap);
var myMap;

function initMap() {
    myMap = new ymaps.Map("index-map", {
        center: [59.92095082, 30.30707118],
        zoom: 11,
        controls: []
    });
}