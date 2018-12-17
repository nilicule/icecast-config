<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>Server Information - Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <div class="container"> 
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="admin/">Administration</a></li>
          <li><a href="status.xsl">Server Status</a></li>
          <li class="active"><a href="server_version.xsl">Version</a></li>
        </ul>
        <h3 class="text-muted">Icecast Streaming Media Server</h3>
      </div>
      <!--end index header menu -->

      <xsl:for-each select="/icestats">
        <div class="panel panel-info">
          <div class="panel-heading">Server Information</div>
          <div class="panel-body">
            <dl class="dl-horizontal">
              <dt>Location</dt>
              <dd><xsl:value-of select="location" /></dd>
              <dt>Admin</dt>
              <dd><xsl:value-of select="admin" /></dd>
              <dt>Host</dt>
              <dd><xsl:value-of select="host" /></dd>
              <dt>Version</dt>
              <dd><xsl:value-of select="server_id" /></dd>
            </dl>
          </div>
        </div>
      </xsl:for-each>

      <xsl:for-each select="/icestats">
        <div class="footer">
          Made with <span id="heart" style="font-size: 12px; text-align: center; color: #BA0000;"><xsl:text disable-output-escaping="yes"><![CDATA[&hearts;]]></xsl:text></span> by <a href="http://studio5-0.com">studio 5-0</a>, running on <a href="https://www.icecast.org"><xsl:value-of select="server_id" /></a>
        </div>
      </xsl:for-each>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
