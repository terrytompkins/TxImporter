<%@ page import="com.bt.paymode.tximporter.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyName', 'error')} required">
	<label for="companyName">
		<g:message code="company.companyName.label" default="Company Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyName" required="" value="${companyInstance?.companyName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'legalName', 'error')} ">
	<label for="legalName">
		<g:message code="company.legalName.label" default="Legal Name" />
		
	</label>
	<g:textField name="legalName" value="${companyInstance?.legalName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'membershipId', 'error')} required">
	<label for="membershipId">
		<g:message code="company.membershipId.label" default="Membership Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="membershipId" required="" value="${companyInstance?.membershipId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'fedTaxIdNum', 'error')} ">
	<label for="fedTaxIdNum">
		<g:message code="company.fedTaxIdNum.label" default="Fed Tax Id Num" />
		
	</label>
	<g:textField name="fedTaxIdNum" value="${companyInstance?.fedTaxIdNum}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="company.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${companyInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'fax', 'error')} ">
	<label for="fax">
		<g:message code="company.fax.label" default="Fax" />
		
	</label>
	<g:textField name="fax" value="${companyInstance?.fax}"/>
</div>

