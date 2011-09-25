import groovy.xml.MarkupBuilder
import org.axiomaticit.model.QuestionType

class BootStrap {

    def init = { servletContext ->
		new QuestionType(code:"RATE", name:"Rating").save()
		new QuestionType(code:"YESNO", name:"Yes or No").save()
		
		org.axiomaticit.model.Prompt.metaClass.asVXML = { ->
			def vxml = new MarkupBuilder()
			
			vxml(version: "2.0", "xml:lang":"en-US", "xmlns":"http://www.w3.org/2001/vxml") {
				form ("", id: "captureResponse") {
					log "Made it to prompt!" 
					block {
						prompt(bargein: "false", timeout: "8000ms", "xml:lang": "en-US") {
							audio(src: "/${app-name}/prompt/fetch/${promptInstance.id}", promptInstance.text)	
						}
					}
					block {
						"submit"(next: "captureResponse")
					}
				}
			}
		}
		
		org.axiomaticit.model.Question.metaClass.asVXML = { ->
			def grammars = questionInstance.questionType.grammars
			def vxml = new MarkupBuilder()
			
			vxml(version:"2.0", "xml:lang":"en-US", "xmlns":"http://www.w3.org/2001/vxml") {
				form("", id: "captureResponse") {
					"field"("", name: "surveyInput") {
						prompt(bargein: "false", timeout: "8000ms") {
							audio(src: "/${app.name}/prompt/fetch/${questionInstance.id}", questionInstance.text)
						}
						grammars.each {
							grammar(mode: "${it.mode}", "xml:lang": "en-US", maxage: "0", weight: "1.0", src: "/ivr-survey/grammar/fetch/${it.id}", type: "application/srgs+xml")
						}
					}
					noinput {
						audio(src: "/${app.name}/message/fetch/${session?.noInput}")
						prompt("I did not understand your response.")
						reprompt()
					}
					nomatch { 
						audio(src: "/${app.name}/message/fetch/${session?.noMatch}")
						prompt("Your input is invalid.")
						reprompt()
					}
					block {
						"submit"(next: "captureResponse", method: "post")
					}				
				}
			}
		}
    }
    def destroy = {
    }
}
