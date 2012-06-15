package com.bt.paymode.tximporter

import java.util.Date;

class Company {
	String companyName
	String legalName
	String fedTaxIdNum
	String phone
	String fax
	String membershipId
	// User modifiedBy
	Date dateCreated
	Date lastUpdated

	static constraints = {
		companyName(blank:false, unique:true)
		legalName(blank:true)
		membershipId(blank:false)
		fedTaxIdNum(blank:true)
		phone(blank:true)
		fax(blank:true)
		//modifiedBy()
		lastUpdated()
		dateCreated()
	}
	
	String toString() {
		return companyName
	}
}
