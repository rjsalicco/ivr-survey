package org.axiomaticit.model

class GrammarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [grammarInstanceList: Grammar.list(params), grammarInstanceTotal: Grammar.count()]
    }

    def create = {
        def grammarInstance = new Grammar()
        grammarInstance.properties = params
        return [grammarInstance: grammarInstance]
    }

    def save = {
        def grammarInstance = new Grammar(params)
		grammarInstance.contentType = "application/grxml"
        if (grammarInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'grammar.label', default: 'Grammar'), grammarInstance.id])}"
            redirect(action: "edit", id: grammarInstance.id)
        }
        else {
            render(view: "create", model: [grammarInstance: grammarInstance])
        }
    }

    def edit = {
        def grammarInstance = Grammar.get(params.id)
        if (!grammarInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grammar.label', default: 'Grammar'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [grammarInstance: grammarInstance]
        }
    }

    def fetch = {
	   println "Fetching grammar!"
	   def grammarInstance = Grammar.get(params.id)
	   response.setContentType("application/grxml")
	   response.setHeader("Content-disposition", "attachment; filename=${grammarInstance.id}")
	   response.outputStream << grammarInstance.data
    }

    def update = {
        def grammarInstance = Grammar.get(params.id)
        if (grammarInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (grammarInstance.version > version) {
                    
                    grammarInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'grammar.label', default: 'Grammar')] as Object[], "Another user has updated this Grammar while you were editing")
                    render(view: "edit", model: [grammarInstance: grammarInstance])
                    return
                }
            }
            grammarInstance.properties = params
            if (!grammarInstance.hasErrors() && grammarInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'grammar.label', default: 'Grammar'), grammarInstance.id])}"
                redirect(action: "edit", id: grammarInstance.id)
            }
            else {
                render(view: "edit", model: [grammarInstance: grammarInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grammar.label', default: 'Grammar'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def grammarInstance = Grammar.get(params.id)
        if (grammarInstance) {
            try {
                grammarInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'grammar.label', default: 'Grammar'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'grammar.label', default: 'Grammar'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grammar.label', default: 'Grammar'), params.id])}"
            redirect(action: "list")
        }
    }
}
