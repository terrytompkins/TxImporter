package com.bt.paymode.tximporter

import java.util.Date;

class ImportFieldMapElement {
	String clientFieldName
	Integer fieldPosition
	String paymodeTable
	String paymodeField
	String notes
	static belongsTo = [importFieldMap: ImportFieldMap]
	// User modifiedBy
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		clientFieldName(blank:false)
		fieldPosition(min:0)
		paymodeTable(blank:false)
		paymodeField(blank:false)
		notes(blank:true)
		//modifiedBy()
		lastUpdated()
		dateCreated()
	}
	
	String toString() {
		return clientFieldName
	}
	
}
