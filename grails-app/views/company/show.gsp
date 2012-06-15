
<%@ page import="com.bt.paymode.tximporter.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-company" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list company">
			
				<g:if test="${companyInstance?.companyName}">
				<li class="fieldcontain">
					<span id="companyName-label" class="property-label"><g:message code="company.companyName.label" default="Company Name" /></span>
					
						<span class="property-value" aria-labelledby="companyName-label"><g:fieldValue bean="${companyInstance}" field="companyName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.legalName}">
				<li class="fieldcontain">
					<span id="legalName-label" class="property-label"><g:message code="company.legalName.label" default="Legal Name" /></span>
					
						<span class="property-value" aria-labelledby="legalName-label"><g:fieldValue bean="${companyInstance}" field="legalName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.membershipId}">
				<li class="fieldcontain">
					<span id="membershipId-label" class="property-label"><g:message code="company.membershipId.label" default="Membership Id" /></span>
					
						<span class="property-value" aria-labelledby="membershipId-label"><g:fieldValue bean="${companyInstance}" field="membershipId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.fedTaxIdNum}">
				<li class="fieldcontain">
					<span id="fedTaxIdNum-label" class="property-label"><g:message code="company.fedTaxIdNum.label" default="Fed Tax Id Num" /></span>
					
						<span class="property-value" aria-labelledby="fedTaxIdNum-label"><g:fieldValue bean="${companyInstance}" field="fedTaxIdNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="company.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${companyInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="company.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${companyInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="company.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${companyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="company.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${companyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:link class="edit" action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
