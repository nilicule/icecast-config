<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="/style.css" />
    </head>
    <body>
    <div class="container">
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="stats.xsl">Admin Home</a></li>
          <li><a href="listmounts.xsl">Mountpoint List</a></li>
          <li><a href="/status.xsl">Public Home</a></li>
        </ul>
        <h3 class="text-muted">Icecast2 Admin</h3>
      </div>
      <!--end index header menu -->

      <!--global server stats-->
      <div class="panel panel-info">
        <div class="panel-heading">Global Server Stats</div>
        <div class="panel-body">
          <dl class="dl-horizontal">
            <xsl:for-each select="/icestats">
              <xsl:for-each select="*">
                <xsl:if test = "name()!='source'">
                  <dt><xsl:value-of select="name()" /></dt>
                  <dd><xsl:value-of select="." /></dd>
                </xsl:if>
              </xsl:for-each>
            </xsl:for-each>
          </dl>
        </div>
      </div>
      <!--end global server stats-->
    
      <!--mount point stats-->
      <xsl:for-each select="source">
        <xsl:if test = "listeners!=''">
          <div class="panel panel-default">
            <div class="panel-heading">
              Mount Point <var><xsl:value-of select="@mount" /></var>
              <div class="pull-right">
                <xsl:choose>
                  <xsl:when test="authenticator">
                    <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span>Login</a>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="btn-group" role="group" aria-label="Stream Format">
                      <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-audio-o"></span>.m3u</a>
                      <a href="{@mount}.pls" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-text-o"></span>.pls</a>
                      <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-code-o"></span><abbr title="XML Shareable Playlist Format">.xspf</abbr></a>
                      <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-o"></span><abbr title="Vorbis Comment Like Text">VCLT</abbr></a>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
            <div class="panel-body">
              <div class="btn-group" role="group" aria-label="Manage stream">
                <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span>List Clients</a>
                <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span>Move Listeners</a>
                <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span>Update Metadata</a>
                <xsl:if test="authenticator">
                  <a href="manageauth.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span>Manage Authentication</a>
                </xsl:if>
                <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Kill Source</a>
              </div>
              <dl class="dl-horizontal">
                <xsl:for-each select="*">
                  <dt><xsl:value-of select="name()" /></dt>
                  <dd><xsl:value-of select="." /></dd>
                </xsl:for-each>
              </dl>
            </div>
          </div>
        </xsl:if>
      </xsl:for-each>
      <!--end mount point stats-->
      <xsl:for-each select="/icestats">
        <div class="footer">
          Made with <span id="heart" style="font-size: 12px; text-align: center; color: #BA0000;"><xsl:text disable-output-escaping="yes"><![CDATA[&hearts;]]></xsl:text></span> by <a href="http://studio5-0.com">studio 5-0</a>, running on <a href="https://www.icecast.org"><xsl:value-of select="server_id" /></a>
        </div>
      </xsl:for-each>
    </div>
    <script src="//code.jquery.com/jquery-latest.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>/*<![CDATA[*/
    $('*[title]').tooltip();
    /*]]>*/</script>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
