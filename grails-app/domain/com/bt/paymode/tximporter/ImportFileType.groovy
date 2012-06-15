package com.bt.paymode.tximporter

import java.util.Date;

class ImportFileType {
	String typeName
	String description
	Integer displayOrder
	// User modifiedBy
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		typeName(blank:false, unique:true)
		description(blank:true)
		displayOrder(nullable:true)
		// modifiedBy()
		lastUpdated()
		dateCreated()
    }
	
	String toString() {
		return typeName
	}
}
