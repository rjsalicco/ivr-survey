package org.axiomaticit.model

class Grammar {

	String name
	String mode
	String contentType
	byte[] data
	
    static constraints = {
    }

	def String toString() {
		"$name"
	}
}