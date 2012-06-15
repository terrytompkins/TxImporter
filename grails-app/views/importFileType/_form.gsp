<%@ page import="com.bt.paymode.tximporter.ImportFileType" %>



<div class="fieldcontain ${hasErrors(bean: importFileTypeInstance, field: 'typeName', 'error')} required">
	<label for="typeName">
		<g:message code="importFileType.typeName.label" default="Type Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="typeName" required="" value="${importFileTypeInstance?.typeName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFileTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="importFileType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${importFileTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importFileTypeInstance, field: 'displayOrder', 'error')} ">
	<label for="displayOrder">
		<g:message code="importFileType.displayOrder.label" default="Display Order" />
		
	</label>
	<g:field type="number" name="displayOrder" value="${importFileTypeInstance.displayOrder}"/>
</div>

