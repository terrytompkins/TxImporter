
<%@ page import="com.bt.paymode.tximporter.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-company" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="companyName" title="${message(code: 'company.companyName.label', default: 'Company Name')}" />
					
						<g:sortableColumn property="legalName" title="${message(code: 'company.legalName.label', default: 'Legal Name')}" />
					
						<g:sortableColumn property="membershipId" title="${message(code: 'company.membershipId.label', default: 'Membership Id')}" />
					
						<g:sortableColumn property="fedTaxIdNum" title="${message(code: 'company.fedTaxIdNum.label', default: 'Fed Tax Id Num')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'company.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="fax" title="${message(code: 'company.fax.label', default: 'Fax')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "companyName")}</g:link></td>
					
						<td>${fieldValue(bean: companyInstance, field: "legalName")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "membershipId")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "fedTaxIdNum")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "fax")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
