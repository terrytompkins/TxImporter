
<%@ page import="com.bt.paymode.tximporter.ImportData" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importData.label', default: 'ImportData')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-importData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-importData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'importData.filename.label', default: 'Filename')}" />
					
						<th><g:message code="importData.importFileType.label" default="Import File Type" /></th>
					
						<g:sortableColumn property="fileContent" title="${message(code: 'importData.fileContent.label', default: 'File Content')}" />
					
						<g:sortableColumn property="importDate" title="${message(code: 'importData.importDate.label', default: 'Import Date')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'importData.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'importData.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${importDataInstanceList}" status="i" var="importDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${importDataInstance.id}">${fieldValue(bean: importDataInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: importDataInstance, field: "importFileType")}</td>
					
						<td>${fieldValue(bean: importDataInstance, field: "fileContent")}</td>
					
						<td><g:formatDate date="${importDataInstance.importDate}" /></td>
					
						<td><g:formatDate date="${importDataInstance.lastUpdated}" /></td>
					
						<td><g:formatDate date="${importDataInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${importDataInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
