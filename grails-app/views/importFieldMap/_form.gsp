<%@ page import="com.bt.paymode.tximporter.ImportFieldMap" %>



<div class="fieldcontain ${hasErrors(bean: importFieldMapInstance, field: 'mapName', 'error')} required">
	<label for="mapName">
		<g:message code="importFieldMap.mapName.label" default="Map Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mapName" required="" value="${importFieldMapInstance?.mapName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="importFieldMap.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${importFieldMapInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="importFieldMap.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${com.bt.paymode.tximporter.Company.list()}" optionKey="id" required="" value="${importFieldMapInstance?.company?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapInstance, field: 'importFieldMapElements', 'error')} ">
	<label for="importFieldMapElements">
		<g:message code="importFieldMap.importFieldMapElements.label" default="Import Field Map Elements" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${importFieldMapInstance?.importFieldMapElements?}" var="i">
    <li><g:link controller="importFieldMapElement" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="importFieldMapElement" action="create" params="['importFieldMap.id': importFieldMapInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement')])}</g:link>
</li>
</ul>

</div>

