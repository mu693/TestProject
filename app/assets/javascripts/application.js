//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require select2-full
//= require disease.js

$(document).ready(function() {
    $('.value-selector').select2();
    $('#disease_status').select2();
});