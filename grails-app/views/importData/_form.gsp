<%@ page import="com.bt.paymode.tximporter.ImportData" %>



<div class="fieldcontain ${hasErrors(bean: importDataInstance, field: 'filename', 'error')} required">
	<label for="filename">
		<g:message code="importData.filename.label" default="Filename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="filename" required="" value="${importDataInstance?.filename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importDataInstance, field: 'importFileType', 'error')} required">
	<label for="importFileType">
		<g:message code="importData.importFileType.label" default="Import File Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="importFileType" name="importFileType.id" from="${com.bt.paymode.tximporter.ImportFileType.list()}" optionKey="id" required="" value="${importDataInstance?.importFileType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: importDataInstance, field: 'fileContent', 'error')} required">
	<label for="fileContent">
		<g:message code="importData.fileContent.label" default="File Content" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="fileContent" name="fileContent" />
</div>

<div class="fieldcontain ${hasErrors(bean: importDataInstance, field: 'importDate', 'error')} ">
	<label for="importDate">
		<g:message code="importData.importDate.label" default="Import Date" />
		
	</label>
	<g:datePicker name="importDate" precision="day"  value="${importDataInstance?.importDate}" default="none" noSelection="['': '']" />
</div>

