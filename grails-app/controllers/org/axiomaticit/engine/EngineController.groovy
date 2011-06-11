package org.axiomaticit.engine

import grails.converters.*

import org.axiomaticit.model.Question
import org.axiomaticit.model.QuestionType
import org.axiomaticit.model.Survey

class EngineController {
	
	def test = {
		render (contentType:"text/xml") {
			vxml(version: "2.0", "xml:lang": "en-US", "xmlns": "http://www.w3.org/2001/vxml") {
				form ("", id: "captureResponse") {
					log "Made it to prompt!" 
					block {
						prompt(bargein: "false", timeout: "8000ms", "xml:lang": "en-US", "The Survey Application is Working!")
					}
				}
			}
		}
	}

	def start = {
		def surveyInstance = Survey.findByDnis(params.id)
		params.each {
			println it
		}
		session.noInput = surveyInstance?.noInput?.id
		session.noMatch = surveyInstance?.noMatch?.id
		session.prompts = new ArrayList(surveyInstance?.prompts)
		session.prompt = 0
		redirect(action: "nextPrompt")
	}
	
	def nextPrompt = {
		def prompts = session?.prompts
		def index = session.prompt
		session.prompt = index + 1
		if(prompts[index]) {
			if(prompts[index] instanceof Question)
				renderQuestion(prompts[index])
			else
				renderPrompt(prompts[index])
		} else {
			renderExit()
		}
	}
	
	def captureResponse = {
		params.each {
			println it
		}
		forward(action: "nextPrompt")
	}
	
	def renderPrompt(promptInstance) {
		render (contentType:"text/xml") {
			vxml(version: "2.0", "xml:lang": "en-US", "xmlns": "http://www.w3.org/2001/vxml") {
				form ("", id: "captureResponse") {
					log "Made it to prompt!" 
					block {
						prompt(bargein: "false", timeout: "8000ms", "xml:lang": "en-US") {
							audio(src: "http://flsp5kc9cd1:8080/ivr-survey/prompt/fetch/${promptInstance.id}", promptInstance.text)						}
					}
					block {
						"submit"(next: "captureResponse")
					}
				}
			}
		}
	}
	
	def renderQuestion(questionInstance) {
		def grammars = questionInstance.questionType.grammars
		
		render (contentType:"text/xml") {
			vxml(version:"2.0", "xml:lang": "en-US", "xmlns":"http://www.w3.org/2001/vxml") {
				form("", id: "captureResponse") {
					"field"("", name: "surveyInput") {
						prompt(bargein: "false", timeout: "8000ms") {
							audio(src: "http://flsp5kc9cd1:8080/ivr-survey/prompt/fetch/${questionInstance.id}", questionInstance.text)
						}
						grammars.each {
							grammar(mode: "${it.mode}", "xml:lang": "en-US", maxage: "0", weight: "1.0", src: "http://flsp5kc9cd1:8080/ivr-survey/grammar/fetch/${it.id}", type: "application/srgs+xml")
						}
					}
					noinput {
						audio(src: "/ivr-survey/message/fetch/${session?.noInput}")
						prompt("I did not understand your response.")
						reprompt()
					}
					nomatch { 
						audio(src: "/ivr-survey/message/fetch/${session?.noMatch}")
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
	
	def renderExit() {
		render (contentType:"text/xml") {
			vxml(version:"2.1", "xml:lang": "en-US", "xmlns":"http://www.w3.org/2001/vxml") {
				form("", id: "captureResponse") {
					block {
						
					}
				}
			}
		}
	}
}