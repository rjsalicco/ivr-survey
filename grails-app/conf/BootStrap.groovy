import org.axiomaticit.model.QuestionType

class BootStrap {

    def init = { servletContext ->
		new QuestionType(code:"RATE", name:"Rating").save()
		new QuestionType(code:"YESNO", name:"Yes or No").save()
    }
    def destroy = {
    }
}
