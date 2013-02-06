/* Author: 

*/



$('document').ready(function(){

	$('#firstBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');
		$('body').css('background', 'black');
		e.preventDefault();
		$('div#first').css('visibility', 'visible');
	});
	$('#secondBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');
		e.preventDefault();
		$('div#second').css('visibility', 'visible');
	});
	$('#thirdBatch').click(function(e){
		$('div#container').hide();
		$('div.image-featured').css('visibility', 'hidden');

		e.preventDefault();
		$('div#third').css('visibility', 'visible');
	});
	$('div#close-YIP').click(function(e) {
		e.preventDefault();
		$('div.image-featured').css('visibility', 'hidden');
		$('div#main-image').css('visibility', 'visible');
		$('body').css('color') === "rgb(255, 255, 255)" ? null : $('body').css('background', 'white');
		$('div#container').fadeIn();
	});
	var captionDisplay = "hidden";
	$('a.toggle-caption').click(function(e) {
		e.preventDefault();
		if (captionDisplay === "hidden") {
			captionDisplay = "show";
			$('a.toggle-caption').addClass('here').removeClass('gone');
			$('div.caption-YIP').text($(this).attr('title')).fadeIn();
		} else {
			captionDisplay = "hidden";
			$('a.toggle-caption').removeClass('here').addClass('gone');
			$('div.caption-YIP').text($(this).attr('title')).fadeOut();
		}

		
	});

	
	
	$(".fancybox").fancybox({
		width       : 320,
		padding     : 0,
		helpers : {
    		title : {
    			type : 'outside'
    		},
    		overlay: {
			    speedIn: 200, 
			    speedOut: 200
    		} 
    	},
		openEffect	: 'fade',
		closeEffect	: 'fade'
	});


	
});
(function($) {
    
  var allPanels = $('.accordion > dd').hide();
  $('.accordion > dt > a').live('click', function() {
  	var something = $(this);
    allPanels.slideUp('fast');
    $('.accordion > dt > a').removeClass('open');
    if ($(this).parent().next().css('display') === 'none'){
    	$(this).parent().next().slideDown('fast', function(){
    		$('body').animate({scrollTop : something.offset().top}, 'fast');
    	});
    	$(this).addClass('open');	
    	
    	return false;
	} else {
		$(this).parent().next().slideUp('fast');
		$(this).removeClass('open');
		return false;
	}
	
  });

})(jQuery);

var small = "small";
var medium = "medium";
var large = "large";
var fontSizeChange = function (fontSize) {
	$('div.content, dl').children().not('div.weblinks, dt, div.content .hedline h1, div.content .byline, div.content .slug').each(function(){
		$(this).removeClass("large medium small")
		$(this).addClass(fontSize);
	}); 
}
















