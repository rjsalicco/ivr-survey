package org.axiomaticit.model

class Prompt implements Comparable {

	Integer playOrder
	String name
	String text
	String fileName
	String contentType
	byte[] data
	
	static belongsTo = [survey:Survey]
	
    static constraints = {
		playOrder(nullable:false)
		name(blank:false)
    }

	def String toString() {
		"$name"
	}
	
	int compareTo(obj) {
		playOrder.compareTo(obj.playOrder)
	}
}
