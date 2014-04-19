package com.axiomaticit.model

class Message {

	String name
	String text
	String fileName
	String contentType
	byte[] data

    static constraints = {
		name(blank:false)
    }

	def String toString() {
		"$name"
	}
}
