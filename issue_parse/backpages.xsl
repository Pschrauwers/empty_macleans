<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<!--[if lt IE 7]> <html lang="en" class="no-js ie6 oldie"> <![endif]-->
	<!--[if IE 7]>    <html lang="en" class="no-js ie7 oldie"> <![endif]-->
	<!--[if IE 8]>    <html lang="en" class="no-js ie8 oldie"> <![endif]-->
	<!--[if gt IE 8]><!-->
	<html class='no-js' lang='en'>
		<head>
	    <meta charset='utf-8' />
	    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
	    <title></title>
	    <meta content='width=device-width, initial-scale=1.0' name='viewport' />

	    <link href='../WEB_ASSETS/css/style.css' rel='stylesheet' />

	  </head>
  	<body>
			<xsl:for-each select="nitf/body"> 	  
	    <div id='container'>
	      <div id='main' role='main'>
	        <article class="backpages">
							    <div class="image-featured">
										<xsl:if test="photo">
				            	<a class="fancybox">
												<xsl:attribute name="href">	        

			              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />
			            			</xsl:attribute>
												<xsl:attribute name="title">	        
			              			<xsl:value-of select="concat(photo.caption, '&lt;br/&gt;&lt;small&gt;', photo.byline, '&lt;/small&gt;')" />
			            			</xsl:attribute>
				            		<img>
				            			<xsl:attribute name="src">	        
				              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />
				            			</xsl:attribute>
												</>
												<div class="caption-opener">&nbsp;</div>
				            	</a>
										</xsl:if>

				          </div>
	          <div class="slug"><xsl:copy-of select="sections"/></div>
	          <div class="hedline"><h1> <xsl:value-of select="body.head/hedline"/> </h1></div>
	          <div class="abstract"><xsl:value-of select="body.head/abstract"/></div>
	          <div class="byline">
							<xsl:choose>
							  <xsl:when test="body.head/byline">
									By
							    <xsl:value-of select="body.head/byline"/>
							  </xsl:when>
							</xsl:choose>
						</div>
	          <div class="content">
	          	<xsl:choose>
					<xsl:when test="sections='Feschuk'">  
						<img class="head-furniture" src="../WEB_ASSETS/css/images/COL_feschuk@2x.png" />
					</xsl:when>
				</xsl:choose>
	           <xsl:for-each select="body.content/p">
	           	<xsl:choose>
					<xsl:when test="position()=1">
						<p style="text-indent:0;"><xsl:value-of select="."/></p>
					</xsl:when>
					<xsl:otherwise>
						<p><xsl:value-of select="."/></p>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
				<xsl:choose>
					<xsl:when test="sections='Feschuk'">  
						<div class="weblinks">
      						<hr/>
      						Follow Scott Feschuk on Twitter
      						<a class="twitter" href="http://twitter.com/scottfeschuk">@scottfeschuk</a>
    					</div>
					</xsl:when>
				</xsl:choose>
	          </div>
	      </article>
	      </div>
	      <footer></footer>
	    </div>

	        <script src="../WEB_ASSETS/js/jquery-1.6.2.min.js"></script>
	    <script src='../WEB_ASSETS/js/jquery.fancybox.js'></script>
	    <script src='../WEB_ASSETS/js/plugins.js'></script>
	    <script src='../WEB_ASSETS/js/script.js'></script>

	    <!--[if lt IE 7]>
	    <script src='//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js'></script>
	    <script>
	      window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})});
	    </script>
	    <![endif]-->
	    </xsl:for-each>
	  </body>
	</html>
</xsl:template>
</xsl:stylesheet>

