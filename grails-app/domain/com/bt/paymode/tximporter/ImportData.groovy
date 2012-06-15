package com.bt.paymode.tximporter

class ImportData {
	String filename
	ImportFileType importFileType
	byte[] fileContent
	Date importDate
	// User modifiedBy
	Date dateCreated
	Date lastUpdated

    static constraints = {
		filename(blank:false, unique:true)
		importFileType(nullable:false)
		fileContent(maxSize:50000000)
		importDate(nullable:true)
		//modifiedBy()
		lastUpdated()
		dateCreated()
    }
	
	String toString() {
		return filename
	}
}
