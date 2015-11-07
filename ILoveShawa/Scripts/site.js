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
            shopItems.dom[i] = $(".shop-item[shop-id=" + shop.Id + "]").first();
            myPlacemark = new ymaps.Placemark([shop.Longitude, shop.Latitude],
                { iconContent: i, balloonContentHeader: "<a href=\"" + shop.Url + "\">" + shop.Name + "</a>" });
            shopItems.placemarks[i] = myPlacemark;
            myPlacemark.events
                .add("mouseenter", mouseenterPlacemark)
                .add("mouseleave", mouseleavePlacemark)
                .add("click", clickPlacemark)
                .add("balloonclose", balloonclosePlacemark);
            myMap.geoObjects.add(myPlacemark);
            shopItems.dom[i].hover(mouseenterShopDomItem, mouseleaveShopDomItem);
        }
    }
}

function mouseenterPlacemark(e) {
    var index = shopItems.placemarks.indexOf(e.get("target"));
    shopItems.placemarks[index].options.set("preset", "islands#orangeStretchyIcon");
    shopItems.placemarks[index].properties.set("iconContent", shopsData[index].Name);
    shopItems.dom[index].addClass("hover");
}

function mouseleavePlacemark(e) {
    var index = shopItems.placemarks.indexOf(e.get("target"));
    e.get("target").options.unset("preset");
    shopItems.placemarks[index].properties.set("iconContent", index);
    shopItems.dom[index].removeClass("hover");
}

function clickPlacemark(e) {
    var index = shopItems.placemarks.indexOf(e.get("target"));
    shopItems.placemarks[index].options.set("preset", "islands#orangeStretchyIcon");
    shopItems.placemarks[index].properties.set("iconContent", shopsData[index].Name);
    shopItems.dom[index].addClass("selected");
    shopItems.dom[index].removeClass("hover");
    var offset = shopItems.dom[index].offset().top;
    var visible_area_start = $(window).scrollTop() + 60;
    var visible_area_end = visible_area_start + window.innerHeight;
    if (offset < visible_area_start || offset > visible_area_end) {
        $('html,body').animate({ scrollTop: offset - window.innerHeight / 3 }, 400);
    }
}

function balloonclosePlacemark(e) {
    var index = shopItems.placemarks.indexOf(e.get("target"));
    shopItems.placemarks[index].options.unset("preset");
    shopItems.placemarks[index].properties.set("iconContent", index);
    shopItems.dom[index].removeClass("selected");
}

function mouseenterShopDomItem(e) {
    index = shopItems.dom.findIndex(function (item) { return item[0] === e.currentTarget; });
    shopItems.placemarks[index].options.set("preset", "islands#orangeStretchyIcon");
    shopItems.placemarks[index].properties.set("iconContent", shopsData[index].Name);
}

function mouseleaveShopDomItem(e) {
    index = shopItems.dom.findIndex(function (item) { return item[0] === e.currentTarget; });
    shopItems.placemarks[index].options.unset("preset");
    shopItems.placemarks[index].properties.set("iconContent", index);

}