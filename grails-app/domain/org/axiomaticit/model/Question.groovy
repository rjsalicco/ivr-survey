package org.axiomaticit.model

class Question extends Prompt {

    QuestionType questionType

    static mapping = {
        questionType lazy: false
    }

    static constraints = {
	
    }
}