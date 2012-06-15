
<%@ page import="com.bt.paymode.tximporter.ImportFieldMap" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importFieldMap.label', default: 'ImportFieldMap')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-importFieldMap" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-importFieldMap" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list importFieldMap">
			
				<g:if test="${importFieldMapInstance?.mapName}">
				<li class="fieldcontain">
					<span id="mapName-label" class="property-label"><g:message code="importFieldMap.mapName.label" default="Map Name" /></span>
					
						<span class="property-value" aria-labelledby="mapName-label"><g:fieldValue bean="${importFieldMapInstance}" field="mapName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="importFieldMap.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${importFieldMapInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="importFieldMap.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${importFieldMapInstance?.company?.id}">${importFieldMapInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapInstance?.importFieldMapElements}">
				<li class="fieldcontain">
					<span id="importFieldMapElements-label" class="property-label"><g:message code="importFieldMap.importFieldMapElements.label" default="Import Field Map Elements" /></span>
					
						<g:each in="${importFieldMapInstance.importFieldMapElements}" var="i">
						<span class="property-value" aria-labelledby="importFieldMapElements-label"><g:link controller="importFieldMapElement" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="importFieldMap.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${importFieldMapInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="importFieldMap.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${importFieldMapInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${importFieldMapInstance?.id}" />
					<g:link class="edit" action="edit" id="${importFieldMapInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
