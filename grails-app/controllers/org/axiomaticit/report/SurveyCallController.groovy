package org.axiomaticit.report

class SurveyCallController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [surveyCallInstanceList: SurveyCall.list(params), surveyCallInstanceTotal: SurveyCall.count()]
    }

    def create = {
        def surveyCallInstance = new SurveyCall()
        surveyCallInstance.properties = params
        return [surveyCallInstance: surveyCallInstance]
    }

    def save = {
        def surveyCallInstance = new SurveyCall(params)
        if (surveyCallInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), surveyCallInstance.id])}"
            redirect(action: "show", id: surveyCallInstance.id)
        }
        else {
            render(view: "create", model: [surveyCallInstance: surveyCallInstance])
        }
    }

    def show = {
        def surveyCallInstance = SurveyCall.get(params.id)
        if (!surveyCallInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
            redirect(action: "list")
        }
        else {
            [surveyCallInstance: surveyCallInstance]
        }
    }

    def edit = {
        def surveyCallInstance = SurveyCall.get(params.id)
        if (!surveyCallInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [surveyCallInstance: surveyCallInstance]
        }
    }

    def update = {
        def surveyCallInstance = SurveyCall.get(params.id)
        if (surveyCallInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surveyCallInstance.version > version) {
                    
                    surveyCallInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surveyCall.label', default: 'SurveyCall')] as Object[], "Another user has updated this SurveyCall while you were editing")
                    render(view: "edit", model: [surveyCallInstance: surveyCallInstance])
                    return
                }
            }
            surveyCallInstance.properties = params
            if (!surveyCallInstance.hasErrors() && surveyCallInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), surveyCallInstance.id])}"
                redirect(action: "show", id: surveyCallInstance.id)
            }
            else {
                render(view: "edit", model: [surveyCallInstance: surveyCallInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def surveyCallInstance = SurveyCall.get(params.id)
        if (surveyCallInstance) {
            try {
                surveyCallInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyCall.label', default: 'SurveyCall'), params.id])}"
            redirect(action: "list")
        }
    }
}
