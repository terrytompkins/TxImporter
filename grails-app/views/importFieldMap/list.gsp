
<%@ page import="com.bt.paymode.tximporter.ImportFieldMap" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importFieldMap.label', default: 'ImportFieldMap')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-importFieldMap" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-importFieldMap" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="mapName" title="${message(code: 'importFieldMap.mapName.label', default: 'Map Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'importFieldMap.description.label', default: 'Description')}" />
					
						<th><g:message code="importFieldMap.company.label" default="Company" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'importFieldMap.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'importFieldMap.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${importFieldMapInstanceList}" status="i" var="importFieldMapInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${importFieldMapInstance.id}">${fieldValue(bean: importFieldMapInstance, field: "mapName")}</g:link></td>
					
						<td>${fieldValue(bean: importFieldMapInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: importFieldMapInstance, field: "company")}</td>
					
						<td><g:formatDate date="${importFieldMapInstance.lastUpdated}" /></td>
					
						<td><g:formatDate date="${importFieldMapInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${importFieldMapInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
