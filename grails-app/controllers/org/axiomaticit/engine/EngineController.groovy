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
				prompts[index].asVXML()
			else
				prompts[index].asVXML()
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