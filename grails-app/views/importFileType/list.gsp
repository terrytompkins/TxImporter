
<%@ page import="com.bt.paymode.tximporter.ImportFileType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importFileType.label', default: 'ImportFileType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-importFileType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-importFileType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="typeName" title="${message(code: 'importFileType.typeName.label', default: 'Type Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'importFileType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="displayOrder" title="${message(code: 'importFileType.displayOrder.label', default: 'Display Order')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'importFileType.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'importFileType.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${importFileTypeInstanceList}" status="i" var="importFileTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${importFileTypeInstance.id}">${fieldValue(bean: importFileTypeInstance, field: "typeName")}</g:link></td>
					
						<td>${fieldValue(bean: importFileTypeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: importFileTypeInstance, field: "displayOrder")}</td>
					
						<td><g:formatDate date="${importFileTypeInstance.lastUpdated}" /></td>
					
						<td><g:formatDate date="${importFileTypeInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${importFileTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
