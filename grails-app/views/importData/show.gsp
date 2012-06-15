
<%@ page import="com.bt.paymode.tximporter.ImportData" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importData.label', default: 'ImportData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-importData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-importData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list importData">
			
				<g:if test="${importDataInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="importData.filename.label" default="Filename" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${importDataInstance}" field="filename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importDataInstance?.importFileType}">
				<li class="fieldcontain">
					<span id="importFileType-label" class="property-label"><g:message code="importData.importFileType.label" default="Import File Type" /></span>
					
						<span class="property-value" aria-labelledby="importFileType-label"><g:link controller="importFileType" action="show" id="${importDataInstance?.importFileType?.id}">${importDataInstance?.importFileType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${importDataInstance?.fileContent}">
				<li class="fieldcontain">
					<span id="fileContent-label" class="property-label"><g:message code="importData.fileContent.label" default="File Content" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importDataInstance?.importDate}">
				<li class="fieldcontain">
					<span id="importDate-label" class="property-label"><g:message code="importData.importDate.label" default="Import Date" /></span>
					
						<span class="property-value" aria-labelledby="importDate-label"><g:formatDate date="${importDataInstance?.importDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importDataInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="importData.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${importDataInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importDataInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="importData.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${importDataInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${importDataInstance?.id}" />
					<g:link class="edit" action="edit" id="${importDataInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
