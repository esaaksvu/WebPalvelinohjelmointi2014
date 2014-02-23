var BREWERIES = {};

BREWERIES.show = function(){

    $("#brewerytable tr:gt(0)").remove();
    var table = $("#brewerytable");

    $.each(BREWERIES.list, function (index, b) {
        table.append('<tr>'
            +'<td>'+b['name']+'</td>'
            +'<td>'+b['year']+'</td>'
            +'<td>'+b['beers'].length+'</td>'
            +'</tr>');
    });
};

BREWERIES.sort_by_name = function(){
    BREWERIES.list.sort( function(a,b){
        return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
    });
};

BREWERIES.sort_by_year = function(){
    BREWERIES.list.sort( function(a,b){
        return a.year > b.year;
    });
};

BREWERIES.sort_by_beer_count = function(){
    BREWERIES.list.sort( function(a,b){
        return a.beers.length > b.beers.length;
    });
};

$(document).ready(function () {
    $("#name").click(function (e) {
        BREWERIES.sort_by_name();
        BREWERIES.show();
        e.preventDefault();
    });

    $("#year").click(function (e) {
        BREWERIES.sort_by_year();
        BREWERIES.show();
        e.preventDefault();
    });

    $("#beers").click(function (e) {
        BREWERIES.sort_by_beer_count();
        BREWERIES.show();
        e.preventDefault();
    });

    if ( $("#brewerytable").length>0 ) {
        $.getJSON('breweries.json', function (breweries) {
            BREWERIES.list = breweries;
            BREWERIES.sort_by_name();
            BREWERIES.show();
        });
    }
});