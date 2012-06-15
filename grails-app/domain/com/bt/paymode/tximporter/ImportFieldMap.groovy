package com.bt.paymode.tximporter

import java.util.Date;

class ImportFieldMap {
	String mapName
	String description
	static belongsTo = [company: Company]
	static hasMany = [importFieldMapElements: ImportFieldMapElement]
	// User modifiedBy
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		mapName(blank:false, unique:true)
		description(blank:true)
		company()
		importFieldMapElements()
		//modifiedBy()
		lastUpdated()
		dateCreated()
	}
	
	String toString() {
		return mapName
	}
	
}
