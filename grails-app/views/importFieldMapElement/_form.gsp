<%@ page import="com.bt.paymode.tximporter.ImportFieldMapElement" %>



<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'clientFieldName', 'error')} required">
	<label for="clientFieldName">
		<g:message code="importFieldMapElement.clientFieldName.label" default="Client Field Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clientFieldName" required="" value="${importFieldMapElementInstance?.clientFieldName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'fieldPosition', 'error')} required">
	<label for="fieldPosition">
		<g:message code="importFieldMapElement.fieldPosition.label" default="Field Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="fieldPosition" min="0" required="" value="${importFieldMapElementInstance.fieldPosition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'paymodeTable', 'error')} required">
	<label for="paymodeTable">
		<g:message code="importFieldMapElement.paymodeTable.label" default="Paymode Table" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paymodeTable" required="" value="${importFieldMapElementInstance?.paymodeTable}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'paymodeField', 'error')} required">
	<label for="paymodeField">
		<g:message code="importFieldMapElement.paymodeField.label" default="Paymode Field" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paymodeField" required="" value="${importFieldMapElementInstance?.paymodeField}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="importFieldMapElement.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${importFieldMapElementInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFieldMapElementInstance, field: 'importFieldMap', 'error')} required">
	<label for="importFieldMap">
		<g:message code="importFieldMapElement.importFieldMap.label" default="Import Field Map" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="importFieldMap" name="importFieldMap.id" from="${com.bt.paymode.tximporter.ImportFieldMap.list()}" optionKey="id" required="" value="${importFieldMapElementInstance?.importFieldMap?.id}" class="many-to-one"/>
</div>

