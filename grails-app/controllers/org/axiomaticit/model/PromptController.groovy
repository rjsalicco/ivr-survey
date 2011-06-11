package org.axiomaticit.model

class PromptController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [promptInstanceList: Prompt.list(params), promptInstanceTotal: Prompt.count()]
    }

    def create = {
        def promptInstance = new Prompt()
        promptInstance.properties = params
        return [promptInstance: promptInstance]
    }

    def save = {
        def promptInstance = new Prompt(params)
		promptInstance.data = request.getFile('data').bytes
		promptInstance.contentType = "audio/x-wav"
		promptInstance.fileName = "test.wav"
		
        if (promptInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'prompt.label', default: 'Prompt'), promptInstance.id])}"
            redirect(controller: "survey", action: "edit", id: promptInstance.survey.id)
        }
        else {
            render(view: "create", model: [promptInstance: promptInstance])
        }
    }

    def edit = {
        def promptInstance = Prompt.get(params.id)
        if (!promptInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'prompt.label', default: 'Prompt'), params.id])}"
            redirect(action: "list")
        }
        else {
			//check to see if we have a Question or a Prompt
			if(promptInstance.instanceOf(Question)) {
				redirect(controller: "question", action: "edit", id: promptInstance.id)
			}
			else {
            	return [promptInstance: promptInstance]
			}
        }
    }

    def fetch = {
	   println "Fetching audio!"
	   def promptInstance = Prompt.get(params.id)
	   response.setContentType("audio/wav")
	   response.setHeader("Content-disposition", "attachment; filename=${promptInstance.id}")
	   response.outputStream << promptInstance.data
    }

    def update = {
        def promptInstance = Prompt.get(params.id)
        if (promptInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (promptInstance.version > version) {
                    
                    promptInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'prompt.label', default: 'Prompt')] as Object[], "Another user has updated this Prompt while you were editing")
                    render(view: "edit", model: [promptInstance: promptInstance])
                    return
                }
            }
            promptInstance.properties = params
            if (!promptInstance.hasErrors() && promptInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'prompt.label', default: 'Prompt'), promptInstance.id])}"
                redirect(controller: "survey", action: "edit", id: promptInstance.survey.id)
            }
            else {
                render(view: "edit", model: [promptInstance: promptInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'prompt.label', default: 'Prompt'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def promptInstance = Prompt.get(params.id)
        if (promptInstance) {
            try {
                promptInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'prompt.label', default: 'Prompt'), params.id])}"
                redirect(controller: "survey", action: "edit", id: promptInstance.survey.id)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'prompt.label', default: 'Prompt'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'prompt.label', default: 'Prompt'), params.id])}"
            redirect(controller: "survey", action: "edit", id: promptInstance.survey.id)
        }
    }
}
