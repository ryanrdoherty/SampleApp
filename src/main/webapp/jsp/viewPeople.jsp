<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
  xmlns:c="http://java.sun.com/jsp/jstl/core"
  xmlns:fmt="http://java.sun.com/jsp/jstl/fmt"
  xmlns:s="/struts-tags"
  xmlns:sx="/struts-dojo-tags"
  version="2.1">
<jsp:directive.page contentType="text/html" />
<html>
  <head>
    <title>${applicationName}: Person Information</title>
    <link rel="stylesheet" href="inc/styles.css" type="text/css"/>
    <link rel="stylesheet" href="inc/jquery-ui/css/smoothness/jquery-ui-1.8.4.custom.css" type="text/css"/>
    <script src="inc/jquery.js" type="text/javascript"> /*-*/ </script>
    <script src="inc/jquery-ui/js/jquery-ui-1.8.4.custom.min.js" type="text/javascript"> /*-*/ </script>
    <script type="text/javascript">
      $(document).ready(function(){
        $(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
      });
      function deletePerson(id) {
          var formId = 'form' + id;
          var form = $('#'+formId)[0];
          if (confirm('Are you sure you want to delete this person and all relevant data?')) {
            form.operation.value="DELETE";
            form.submit();
          }
      }
    </script>
  </head>
  <body>
    <div class="pagecontent">
      <h2>Person Data</h2>
      <c:set var="userMessage" value="${message}"/>
      <c:if test="${!empty userMessage}">
        <p><span class="message">${userMessage}</span></p>
      </c:if>
      <table cellpadding="2">
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Suffix</th>
          <th>Birth Date</th>
          <th>Sex</th>
          <c:if test="${hasWritePerm}">
            <th>Operations</th>
          </c:if>
        </tr>
        <s:iterator var="person" value="people">
          <form id="form${person.id}" name="form${person.id}" action="UpdatePerson" method="post">
            <input type="hidden" name="operation" value="UPDATE"/>
            <tr>
              <c:if test="${hasWritePerm}">
                <td>${person.id}<s:hidden key="person.id"/></td>
                <td><s:textfield key="person.firstName" size="10"/></td>
                <td><s:textfield key="person.lastName" size="10"/></td>
                <td><s:select emptyOption="true" list="nameSuffixes" key="person.suffix" listKey="name" listValue="description"/></td>
                <td><input type="text" size="10" id="birthDate${person.id}" class="datepicker" name="person.birthDate" value="${person.birthDate}"/></td>
                <td><s:select emptyOption="true" list="sexes" key="person.sex" listKey="name" listValue="description"/></td>
                <td>
                  <input type="submit" value="Save"/>
                  <input type="button" value="Delete" onclick="deletePerson(${person.id})"/>
                </td>
              </c:if>
              <c:if test="${!hasWritePerm}">
                <td>${person.id}</td>
                <td>${person.firstName}</td>
                <td>${person.lastName}</td>
                <td>${person.suffix.description}</td>
                <td>${person.birthDate}</td>
                <td>${person.sex.description}</td>
              </c:if>
            </tr>
          </form>
        </s:iterator>
        <c:if test="${hasWritePerm}">
          <form action="UpdatePerson" method="post">
            <input type="hidden" name="operation" value="CREATE"/>
            <tr>
              <td>N/A</td>
              <td><s:textfield key="person.firstName" size="10"/></td>
              <td><s:textfield key="person.lastName" size="10"/></td>
              <td><s:select emptyOption="true" list="nameSuffixes" key="person.suffix" listKey="name" listValue="description"/></td>
              <td><input type="text" size="10" id="birthDate" class="datepicker" name="person.birthDate"/></td>
              <td><s:select emptyOption="true" list="sexes" key="person.sex" listKey="name" listValue="description"/></td>
              <td><input type="submit" value="Add New"/></td>
            </tr>
          </form>
        </c:if>
      </table>
    </div>
  </body>
</html>
</jsp:root>
