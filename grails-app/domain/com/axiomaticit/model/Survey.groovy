package com.axiomaticit.model

class Survey {

	String title
	String lineOfBusiness
	String dnis
	Message noInput
	Message noMatch

	SortedSet prompts
	static hasMany = [prompts:Prompt]
	
	static fetchMode = [noInput:"eager", noMatch:"eager"]
	
    static constraints = {
		title(blank:false, unique:true)
		lineOfBusiness(blank:false)
		dnis(blank:false, unique:true)
		noInput(nullable:true)
		noMatch(nullable:true)
    }

	def String toString() {
		"$title"
	}
}