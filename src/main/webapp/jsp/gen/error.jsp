<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
  xmlns:c="http://java.sun.com/jsp/jstl/core"
  xmlns:fmt="http://java.sun.com/jsp/jstl/fmt"
  xmlns:s="/struts-tags"
  version="2.1">
<jsp:directive.page contentType="text/html" />
<html>
  <head>
    <script type="text/javascript">
          function showException() {
            var stacktrace = document.getElementById("stacktrace"); 
            if (stacktrace.style.display == "block") {
              stacktrace.style.display = "none";
            }
            else {
              stacktrace.style.display = "block";
            }
          }
    </script>
  </head>
  <body>
    <span onclick="javascript:showException()"><h2>Ack! You had an error!</h2></span>
    Click <a href="Home">here</a> to go back to the main application home.
    <pre id="stacktrace" style="display: none">
      <s:property value="%{exceptionStack}" />
    </pre>
  </body>
</html>
</jsp:root>
