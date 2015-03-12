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

/**********************************************************
* LoadJS Gem is used to load scripts on specific controller actions
***********************************************************/

/****************
* photos#show
*****************/
// Image resizes to window height on initialization
// Image resizes on window-size change
// load({controller: 'photos', action: 'show'}, function (controller, action) {

//     var H = $(window).height() - 75; // Consider navbar height
//     $('#img-photo').height(H);

//     function imgsize() {
//         var H = $(window).height() - 75; // Consider navbar height
//         $('#img-photo').height(H);
//     }
//     // Resize image when browser size changes
//     $(window).bind('resize', function() { imgsize(); });
// });

/****************************************************************************
* pages#home
* portfolios#show, portfolios#show_user_portfolios, portfolios#edit_portfolios
*****************************************************************************/
// Activate justified gallery
load({
    controllers: {
        pages: ['home'],
        portfolios: ['show', 'show_user_portfolios', 'edit_portfolios']
    }
}, function (controller, action) {
    // Randomize only on pages#home
    var randomize = function() {
        if(controller === 'pages' && action === 'home') { return true }
        else { return false }
    }

    $('.justified-container').justifiedGallery({
        rowHeight: 250,
        maxRowHeight: 0,
        margins: 5,
        captions: false,
        lastRow : 'nojustify',
        randomize: randomize()
    });
});

/****************
* portfolios#edit
*****************/
// Allow user to click on image to click checkbox
load({controller: 'portfolios', action: 'edit'}, function (controller, action) {
    $('#remove_image_portfolio_row img').click(function() {
        $(this).siblings('#remove_image').click();
    });
});

/****************
* users#edit
*****************/
// Due to the limitations on styling the file input tag,
// jquery is used with a combination of some CSS to emulate
// the file input tag
load({controller: 'users', action: 'edit'}, function (controller, action) {
    // Button click activates file input button, which is hidden
    $('#browse-click').on('click', function () { 
        $('#uploadFile').click();
    });

    // Shows file name to user
    // Disables or enables checkbox
    $('#uploadFile').change(function() {
        var fileName = $('#uploadFile').val().replace("C:\\fakepath\\", "");
        $('#file-name').text(fileName);

        var fileNameField = $('#file-name').text();
        if(fileNameField !== null && fileNameField.length !== 0) {
            $('#remove-checkbox').attr('disabled', true)
        }
        else if(fileNameField === null || fileNameField.length === 0) {
            $('#remove-checkbox').attr('disabled', false)
        }
    })

    // Disable or enable 'browse for file' button when checkbox is checked/unchecked
    $('#remove-checkbox').change(function() {
        if($('#remove-checkbox').is(':checked') === true) {
            $('#browse-click').attr('disabled', true)
        }
        else {
            $('#browse-click').attr('disabled', false)
        }
    })
});