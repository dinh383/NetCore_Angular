
var $BTN_COMPACT = $('.btn-compact'),
    $BTN_CLOSE_COMPACT = $('.btn-close-compact'),
    $SHEET_BUTTON = $('.sheet-bottom');

$(document).ready(function() {
    $BTN_COMPACT.on('click', function() {
        $SHEET_BUTTON.toggleClass('open-menu');
    });
    $BTN_CLOSE_COMPACT.on('click', function() {
        $SHEET_BUTTON.removeClass('open-menu');
    });
});
