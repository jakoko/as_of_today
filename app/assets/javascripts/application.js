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
//= require jquery_ujs
//= require loadjs
//= require bootstrap-sprockets
//= require_tree .

load({controller: 'photos', action: 'show'}, function (controller, action) {
  
});

load({
    controllers: {
        pages: ['home'],
        portfolios: ['show', 'show_user_portfolios']
    }
}, function (controller, action) {
    $('.justified-container').justifiedGallery({
        rowHeight: 250,
        maxRowHeight: 0,
        margins: 5,
        captions: false,
        lastRow : 'nojustify'
    });
});