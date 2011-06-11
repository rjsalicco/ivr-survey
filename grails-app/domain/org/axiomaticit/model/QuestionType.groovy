package org.axiomaticit.model

class QuestionType {

    String code
    String name
	
    static hasMany = [grammars:Grammar]

    static mapping = {
        grammars lazy: false
    }

    static constraints = {
        code(unique:true)
    }

    def String toString() {
        "$name"
    }
}