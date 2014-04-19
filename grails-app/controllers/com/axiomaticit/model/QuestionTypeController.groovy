package com.axiomaticit.model

class QuestionTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [questionTypeInstanceList: QuestionType.list(params), questionTypeInstanceTotal: QuestionType.count()]
    }

    def create = {
        def questionTypeInstance = new QuestionType()
        questionTypeInstance.properties = params
        return [questionTypeInstance: questionTypeInstance]
    }

    def save = {
        def questionTypeInstance = new QuestionType(params)
        if (questionTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'questionType.label', default: 'QuestionType'), questionTypeInstance.id])}"
            redirect(action: "edit", id: questionTypeInstance.id)
        }
        else {
            render(view: "create", model: [questionTypeInstance: questionTypeInstance])
        }
    }

    def edit = {
        def questionTypeInstance = QuestionType.get(params.id)
        if (!questionTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionType.label', default: 'QuestionType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [questionTypeInstance: questionTypeInstance]
        }
    }

    def update = {
        def questionTypeInstance = QuestionType.get(params.id)
        if (questionTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (questionTypeInstance.version > version) {
                    
                    questionTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'questionType.label', default: 'QuestionType')] as Object[], "Another user has updated this QuestionType while you were editing")
                    render(view: "edit", model: [questionTypeInstance: questionTypeInstance])
                    return
                }
            }
            questionTypeInstance.properties = params
            if (!questionTypeInstance.hasErrors() && questionTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'questionType.label', default: 'QuestionType'), questionTypeInstance.id])}"
                redirect(action: "edit", id: questionTypeInstance.id)
            }
            else {
                render(view: "edit", model: [questionTypeInstance: questionTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionType.label', default: 'QuestionType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def questionTypeInstance = QuestionType.get(params.id)
        if (questionTypeInstance) {
            try {
                questionTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'questionType.label', default: 'QuestionType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'questionType.label', default: 'QuestionType'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionType.label', default: 'QuestionType'), params.id])}"
            redirect(action: "list")
        }
    }
}
