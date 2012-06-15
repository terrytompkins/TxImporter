
<%@ page import="com.bt.paymode.tximporter.ImportFieldMapElement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-importFieldMapElement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-importFieldMapElement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list importFieldMapElement">
			
				<g:if test="${importFieldMapElementInstance?.clientFieldName}">
				<li class="fieldcontain">
					<span id="clientFieldName-label" class="property-label"><g:message code="importFieldMapElement.clientFieldName.label" default="Client Field Name" /></span>
					
						<span class="property-value" aria-labelledby="clientFieldName-label"><g:fieldValue bean="${importFieldMapElementInstance}" field="clientFieldName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.fieldPosition}">
				<li class="fieldcontain">
					<span id="fieldPosition-label" class="property-label"><g:message code="importFieldMapElement.fieldPosition.label" default="Field Position" /></span>
					
						<span class="property-value" aria-labelledby="fieldPosition-label"><g:fieldValue bean="${importFieldMapElementInstance}" field="fieldPosition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.paymodeTable}">
				<li class="fieldcontain">
					<span id="paymodeTable-label" class="property-label"><g:message code="importFieldMapElement.paymodeTable.label" default="Paymode Table" /></span>
					
						<span class="property-value" aria-labelledby="paymodeTable-label"><g:fieldValue bean="${importFieldMapElementInstance}" field="paymodeTable"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.paymodeField}">
				<li class="fieldcontain">
					<span id="paymodeField-label" class="property-label"><g:message code="importFieldMapElement.paymodeField.label" default="Paymode Field" /></span>
					
						<span class="property-value" aria-labelledby="paymodeField-label"><g:fieldValue bean="${importFieldMapElementInstance}" field="paymodeField"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="importFieldMapElement.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${importFieldMapElementInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="importFieldMapElement.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${importFieldMapElementInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="importFieldMapElement.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${importFieldMapElementInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${importFieldMapElementInstance?.importFieldMap}">
				<li class="fieldcontain">
					<span id="importFieldMap-label" class="property-label"><g:message code="importFieldMapElement.importFieldMap.label" default="Import Field Map" /></span>
					
						<span class="property-value" aria-labelledby="importFieldMap-label"><g:link controller="importFieldMap" action="show" id="${importFieldMapElementInstance?.importFieldMap?.id}">${importFieldMapElementInstance?.importFieldMap?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${importFieldMapElementInstance?.id}" />
					<g:link class="edit" action="edit" id="${importFieldMapElementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
