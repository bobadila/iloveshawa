ymaps.ready(initMap);
var myMap;
var shopItems = { dom: [], placemarks: [] };

function initMap() {
    myMap = new ymaps.Map("index-map", {
        center: [59.92095082, 30.36707118],
        zoom: 11,
        controls: []
    });

    if (typeof shopsData !== "undefined") {
        for (var i in shopsData) {
            var shop = shopsData[i];
            myPlacemark = new ymaps.Placemark([shop.Longitude, shop.Latitude], { iconContent: i, hintContent: shop.Name });
            shopItems.dom[i] = $(".shop-item[shop-id=" + shop.Id + "]").first();
            shopItems.placemarks[i] = myPlacemark;
            myPlacemark.events
                .add("mouseenter", mouseenterPlacemark)
                .add("mouseleave", mouseleavePlacemark);
            myMap.geoObjects.add(myPlacemark);
            shopItems.dom[i].hover(mouseenterShopDomItem, mouseleaveShopDomItem);
        }
    }
}

function mouseenterPlacemark(e) {
    e.get("target").options.set("preset", "islands#orangeIcon");
    index = shopItems.placemarks.indexOf(e.get("target"));
    shopItems.dom[index].addClass("selected");
}

function mouseleavePlacemark(e) {
    e.get("target").options.unset("preset");
    index = shopItems.placemarks.indexOf(e.get("target"));
    shopItems.dom[index].removeClass("selected");
}

function mouseenterShopDomItem(e) {
    index = shopItems.dom.findIndex(function (item) { return item[0] === e.currentTarget; });
    shopItems.placemarks[index].options.set("preset", "islands#orangeIcon");
}

function mouseleaveShopDomItem(e) {
    index = shopItems.dom.findIndex(function (item) { return item[0] === e.currentTarget; });
    shopItems.placemarks[index].options.unset("preset");
}