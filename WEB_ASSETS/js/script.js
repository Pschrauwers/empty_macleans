/* Author: 
	Steven Michael Thomas
*/


jQuery(function($) {
	accordionSlider();

	$('#gallery').click(function(){
		openGallery($(this).data('batch'));
	});

	$('#close-YIP').click(function() {
		closeGallery();
	});

	$('.toggle-caption').click(function() {
		toggleCaption();
		return false;	
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

    
 

var small = "small";
var medium = "medium";
var large = "large";
var captionDisplay = "hidden";
function fontSizeChange(fontSize) {
	$('div.content, dl').children().not('div.weblinks, dt, div.content .hedline h1, div.content .byline, div.content .slug').each(function(){
		$(this).removeClass("large medium small")
		$(this).addClass(fontSize);
	}); 
}

function accordionSlider(){
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
}
function openGallery(batch) {
	var batchID = "#" + batch;
	$('div#container').hide();
	$('div.image-featured').css('visibility', 'hidden');
	$('body').css('background', 'black');
	console.log(batchID);
	$(batchID).css('visibility', 'visible');
	return false;
}
function closeGallery(){
	$('div.image-featured').css('visibility', 'hidden');
	$('div#main-image').css('visibility', 'visible');
	$('body').css('color') === "rgb(255, 255, 255)" ? null : $('body').css('background', 'white');
	$('div#container').fadeIn();
}

function toggleCaption(){
	if (captionDisplay === "hidden") {
		captionDisplay = "show";
		$('a.toggle-caption').addClass('here').removeClass('gone');
		$('div.caption-YIP').text($(this).attr('title')).fadeIn();
	} else {
		captionDisplay = "hidden";
		$('a.toggle-caption').removeClass('here').addClass('gone');
		$('div.caption-YIP').text($(this).attr('title')).fadeOut();
	}
	return false;
}













