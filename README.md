GET A COPY OF THE MACLEAN'S ISSUE YOU ARE WORKING ON.

Clone the git repository to your system: 
Open the terminal and navigate to the folder that you created, then enter: 
git clone https://github.com/frika/empty_macleans.git

Rename the empty_macleans folder to the issue number (i.e. MAC48)

Open the XML archive that Drew Maynard sends (the non-split one... to check that it's the non-split file, ensure that BOOKS are all in 1 xml file).

Copy the contents of the images folder to WEB_ASSETS/images
Copy the xml files to the issue_parse folder

In the command line, navigate to the issue_parse folder, and type in the following:

ruby batch_parse.rb

STUFF YOU HAVE TO DO MANUALLY: 

At this point, I go through each story to ensure it looks OK. Once you're happy with it, move it into the issue_html folder to avoid over-writing it if you run the batch_parse.rb again

Table of contents:
1. Figure out what the top-3 featured stories are (Usually cover story, and two stories from the top of the cover) 
2. Adding in featured images: 
    a) Insert the featured story headlines into the below javascript where it says "INSERT HEADLINE HERE"
    b) Copy and paste the following into the 02_contents.html file below the last javascript tag, where it says "PASTE JAVASCRIPT HERE": 

var carousel,el,i,page,slides=[
'<a href="#?ID="><img style="position;relative;max-height:250px;" src="../WEB_ASSETS/images/feature1.jpg"><div class="feature-caption">INSERT HEADLINE HERE</div></a>',
'<a href="#?ID="><img style="max-height:250px;" src="../WEB_ASSETS/images/feature2.jpg"><div class="feature-caption" >INSERT HEADLINE HERE</div></a>',
'<a href="#?ID="><img style="position;relative;max-height:250px;" src="../WEB_ASSETS/images/feature3.jpg"><div class="feature-caption">INSERT HEADLINE HERE</div></a>'
];
carousel=new SwipeView('#wrapper',{numberOfPages:slides.length,hastyPageFlip:true});for(i=0;i<3;i++){page=i==0?slides.length-1:i-1;el=document.createElement('span');el.innerHTML=slides[page];carousel.masterPages[i].appendChild(el)$('div.featured-nav span:eq('+carousel.pageIndex+')').addClass('selected')}carousel.onFlip(function(){var el,upcoming,i;for(i=0;i<3;i++){upcoming=carousel.masterPages[i].dataset.upcomingPageIndex;if(upcoming!=carousel.masterPages[i].dataset.pageIndex){el=carousel.masterPages[i].querySelector('span');el.innerHTML=slides[upcoming]}}$('div.featured-nav span').removeClass('selected');$('div.featured-nav span:eq('+carousel.pageIndex+')').addClass('selected')});

    c) Find the images for the featured stories and crop them to 295px x 200px and save them as feature1.jpg, feature2.jpg and feature3.jpg (same order as javascript) into the WEB_ASSETS/images folder

Letters: 
For the letters article, you need to change some HTML tags. For the name of the letter-writers, change the <p> tags to <em>, and for the letter subjects, change the <p> tags to <b> tags. 

Good News/Bad News:
Check that this looks OK. If it doesn't, and you're seeing giant blocks of text in the accordion indices, there was probably a paragraph break in one of the stories... go to the XML and check the formatting - it should alternate between the section title, and the body paragraph; if there is more than one body paragraph, merge it with the first paragraph, then run the batch_parse.rb again

Books: 
There is a fair bit of work for this one. Firstly, you need to grab the cover images for all of the books being reviewed from the Maclean's closet. There are usually about 5 of them. Crop these down to the standard book size for the web (208pxx310px) and save them in the WEB_ASSETS/images folder

Open the Books HTML file. Scroll down towards the bottom of the document, and you will find the shell of a data-list that looks like this:

<dl class="accordion">
<dt>
  <a class="clearfix" href="">
          <div class="book-image">
         <img src='../WEB_ASSETS/images/**BOOK FILE NAME HERE **' />
    </div>
    <div class="title-author">
      <h3>**INSERT BOOK TITLE HERE**</h3>
      <span>**INSERT AUTHOR NAME HERE**</span>
    </div></a>
</dt>
<dd>**INSERT REVIEW CONTENT HERE**</dd>
</dl>

Copy and paste from the <dt> to </dd> for however many book reviews are in the issue, then from the content higher up in the document, build the accordion based on the structure outlined above. You can include the <p> tags in the <dd></dd> section, but exclude them from the <h3> and <span>

Interview: 
Change the <p> tags around any Questions to <em> tags

Masthead: 
Add <b> tags to the different departments - should be: Bureaus, Design, macleans.ca, rogers publishing limited, photo department, administration, production and technology, and how to reach us

Other common formatting: 
The most common formatting needed for other stories, is adding bold headers to sections of the story. 
To do this, find the <div class="content"> tag and add the letters class ---> <div class="content letters">
Then scroll through the content and change the <p> tags surrounding headers to <b> tags. 
