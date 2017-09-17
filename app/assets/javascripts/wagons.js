$(document).ready(function () {
    $("#wagon_type").change(function () {
        var wagon;
        var wagon_premium;
        var wagon_sv;
        var div;

        wagon = ($(this).val().toLowerCase());
        wagon_premium = $('#premium_' + wagon);
        wagon_sv = $('#sv_' + wagon);

        div = $('#' + wagon);

        div.toggle();
        wagon_premium.toggle();
        wagon_sv.toggle();
    });

});