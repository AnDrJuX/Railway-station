$(document).ready(function () {
    $('.search_form').submit(function () {
        var  first_station;
        var  last_station;

         first_station = $(this).find('#first_station');
         last_station = $(this).find('#last_station');
        console.log(123);
        if ( first_station.val() ==  last_station.val()) {
            alert('Выберите конечную станцию');
            return false;
        }
    });
});