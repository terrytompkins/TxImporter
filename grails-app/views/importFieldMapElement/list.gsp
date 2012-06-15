
<%@ page import="com.bt.paymode.tximporter.ImportFieldMapElement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-importFieldMapElement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-importFieldMapElement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clientFieldName" title="${message(code: 'importFieldMapElement.clientFieldName.label', default: 'Client Field Name')}" />
					
						<g:sortableColumn property="fieldPosition" title="${message(code: 'importFieldMapElement.fieldPosition.label', default: 'Field Position')}" />
					
						<g:sortableColumn property="paymodeTable" title="${message(code: 'importFieldMapElement.paymodeTable.label', default: 'Paymode Table')}" />
					
						<g:sortableColumn property="paymodeField" title="${message(code: 'importFieldMapElement.paymodeField.label', default: 'Paymode Field')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'importFieldMapElement.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'importFieldMapElement.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${importFieldMapElementInstanceList}" status="i" var="importFieldMapElementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${importFieldMapElementInstance.id}">${fieldValue(bean: importFieldMapElementInstance, field: "clientFieldName")}</g:link></td>
					
						<td>${fieldValue(bean: importFieldMapElementInstance, field: "fieldPosition")}</td>
					
						<td>${fieldValue(bean: importFieldMapElementInstance, field: "paymodeTable")}</td>
					
						<td>${fieldValue(bean: importFieldMapElementInstance, field: "paymodeField")}</td>
					
						<td>${fieldValue(bean: importFieldMapElementInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${importFieldMapElementInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${importFieldMapElementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
