// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrapValidator.min
//= require moment
//= require bootstrap-datetimepicker
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require maskedinput
//= require highcharts
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require highcharts/highcharts-more 
//= require bootstrap-sprockets
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .

//require jquery.turbolinks
//require turbolinks

var startBlockUI;

startBlockUI = function(obj) {
  obj.block({
    message: "<h2><span class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></span>Loading...</h2>",
    fadeIn: 300,
    timeout: 300,
    css: {
      border: 'none',
      padding: '7px 0px 15px',
      'top': '184px',
      'left': '264.5px',
      backgroundColor: 'rgba(0, 0, 0, 0.21)',
      '-webkit-border-radius': '11px',
      '-moz-border-radius': '11px',
      opacity: .5,
      color: '#fff',
      margin: '-85px 0px 0px -12px',
      width: '28%'
    }
  });
};
