package com.axiomaticit.engine

import grails.converters.*

import com.axiomaticit.model.Question
import com.axiomaticit.model.QuestionType
import com.axiomaticit.model.Survey

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
			render(contentType:"text/xml") {
				prompts[index].asVXML()
			}
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