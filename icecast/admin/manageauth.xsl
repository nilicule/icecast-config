<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
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

      <h2>Manage Authentication</h2>
      <xsl:if test="iceresponse">
        <div class="panel panel-info">
          <div class="panel-heading">Message</div>
          <div class="panel-body">
            <xsl:for-each select="iceresponse">
              <xsl:value-of select="message" /><br />
            </xsl:for-each>
          </div>
        </div>
      </xsl:if>
      <xsl:for-each select="source">
        <div class="panel panel-default">
          <div class="panel-heading">
            Mountpoint <xsl:value-of select="@mount" />
            <xsl:if test="server_name">
              <small><xsl:value-of select="server_name" /></small>
            </xsl:if>
          </div>
          <div class="panel-body">
            <div class="btn-group" role="group" aria-label="Manage stream">
              <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span>List Clients</a>
              <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span>Move Listeners</a>
              <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span>Update Metadata</a>
              <a href="manageauth.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span>Manage Authentication</a>
              <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Kill Source</a>
            </div>
            <xsl:if test="User">
              <table class="table">
                <thead>
                  <tr>
                    <th>User</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:variable name="themount"><xsl:value-of select="@mount" /></xsl:variable>
                  <xsl:for-each select="User">
                    <tr>
                      <td><xsl:value-of select="username" /></td>
                      <td><a href="manageauth.xsl?mount={$themount}&amp;username={username}&amp;action=delete" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            <fieldset>
              <legend>Add new user</legend>
              <form action="/admin/manageauth.xsl" method="get" class="form-inline" role="form">
                <input type="hidden" name="mount" value="{@mount}" />
                <input type="hidden" name="action" value="add" />
                <div class="form-group">
                  <label class="sr-only" for="username">Username</label>
                  <input type="text" name="username" id="username" placeholder="Username" class="form-control" />
                </div>
                <div class="form-group">
                  <label class="sr-only" for="password">Password</label>
                  <input type="password" name="password" placeholder="Password" class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>Add</button>
              </form>
            </fieldset>
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
