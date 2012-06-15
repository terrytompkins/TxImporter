package com.bt.paymode.tximporter

import org.springframework.dao.DataIntegrityViolationException

class ImportFieldMapElementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [importFieldMapElementInstanceList: ImportFieldMapElement.list(params), importFieldMapElementInstanceTotal: ImportFieldMapElement.count()]
    }

    def create() {
        [importFieldMapElementInstance: new ImportFieldMapElement(params)]
    }

    def save() {
        def importFieldMapElementInstance = new ImportFieldMapElement(params)
        if (!importFieldMapElementInstance.save(flush: true)) {
            render(view: "create", model: [importFieldMapElementInstance: importFieldMapElementInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), importFieldMapElementInstance.id])
        redirect(action: "show", id: importFieldMapElementInstance.id)
    }

    def show() {
        def importFieldMapElementInstance = ImportFieldMapElement.get(params.id)
        if (!importFieldMapElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "list")
            return
        }

        [importFieldMapElementInstance: importFieldMapElementInstance]
    }

    def edit() {
        def importFieldMapElementInstance = ImportFieldMapElement.get(params.id)
        if (!importFieldMapElementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "list")
            return
        }

        [importFieldMapElementInstance: importFieldMapElementInstance]
    }

    def update() {
        def importFieldMapElementInstance = ImportFieldMapElement.get(params.id)
        if (!importFieldMapElementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (importFieldMapElementInstance.version > version) {
                importFieldMapElementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement')] as Object[],
                          "Another user has updated this ImportFieldMapElement while you were editing")
                render(view: "edit", model: [importFieldMapElementInstance: importFieldMapElementInstance])
                return
            }
        }

        importFieldMapElementInstance.properties = params

        if (!importFieldMapElementInstance.save(flush: true)) {
            render(view: "edit", model: [importFieldMapElementInstance: importFieldMapElementInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), importFieldMapElementInstance.id])
        redirect(action: "show", id: importFieldMapElementInstance.id)
    }

    def delete() {
        def importFieldMapElementInstance = ImportFieldMapElement.get(params.id)
        if (!importFieldMapElementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "list")
            return
        }

        try {
            importFieldMapElementInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'importFieldMapElement.label', default: 'ImportFieldMapElement'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
