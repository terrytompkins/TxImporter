package com.bt.paymode.tximporter

import org.springframework.dao.DataIntegrityViolationException

class ImportFieldMapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [importFieldMapInstanceList: ImportFieldMap.list(params), importFieldMapInstanceTotal: ImportFieldMap.count()]
    }

    def create() {
        [importFieldMapInstance: new ImportFieldMap(params)]
    }

    def save() {
        def importFieldMapInstance = new ImportFieldMap(params)
        if (!importFieldMapInstance.save(flush: true)) {
            render(view: "create", model: [importFieldMapInstance: importFieldMapInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), importFieldMapInstance.id])
        redirect(action: "show", id: importFieldMapInstance.id)
    }

    def show() {
        def importFieldMapInstance = ImportFieldMap.get(params.id)
        if (!importFieldMapInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "list")
            return
        }

        [importFieldMapInstance: importFieldMapInstance]
    }

    def edit() {
        def importFieldMapInstance = ImportFieldMap.get(params.id)
        if (!importFieldMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "list")
            return
        }

        [importFieldMapInstance: importFieldMapInstance]
    }

    def update() {
        def importFieldMapInstance = ImportFieldMap.get(params.id)
        if (!importFieldMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (importFieldMapInstance.version > version) {
                importFieldMapInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'importFieldMap.label', default: 'ImportFieldMap')] as Object[],
                          "Another user has updated this ImportFieldMap while you were editing")
                render(view: "edit", model: [importFieldMapInstance: importFieldMapInstance])
                return
            }
        }

        importFieldMapInstance.properties = params

        if (!importFieldMapInstance.save(flush: true)) {
            render(view: "edit", model: [importFieldMapInstance: importFieldMapInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), importFieldMapInstance.id])
        redirect(action: "show", id: importFieldMapInstance.id)
    }

    def delete() {
        def importFieldMapInstance = ImportFieldMap.get(params.id)
        if (!importFieldMapInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "list")
            return
        }

        try {
            importFieldMapInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'importFieldMap.label', default: 'ImportFieldMap'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
