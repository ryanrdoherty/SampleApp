<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
  xmlns:c="http://java.sun.com/jsp/jstl/core"
  xmlns:fmt="http://java.sun.com/jsp/jstl/fmt"
  xmlns:s="/struts-tags"
  version="2.1">
<jsp:directive.page contentType="text/html" />
<html>
  <head>
    <link rel="stylesheet" href="inc/styles.css" type="text/css"/>
    <meta http-equiv="Refresh" content="0; URL=${requestUrl}" />
  </head>
  <body>
    <p>
      Please click <a href="${requestUrl}">here</a> if not redirected to your requested page.
    </p>
  </body>
</html>
</jsp:root>
