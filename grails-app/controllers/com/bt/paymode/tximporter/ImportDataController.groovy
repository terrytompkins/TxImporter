package com.bt.paymode.tximporter

import org.springframework.dao.DataIntegrityViolationException

class ImportDataController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [importDataInstanceList: ImportData.list(params), importDataInstanceTotal: ImportData.count()]
    }

    def create() {
        [importDataInstance: new ImportData(params)]
    }

    def save() {
        def importDataInstance = new ImportData(params)
        if (!importDataInstance.save(flush: true)) {
            render(view: "create", model: [importDataInstance: importDataInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'importData.label', default: 'ImportData'), importDataInstance.id])
        redirect(action: "show", id: importDataInstance.id)
    }

    def show() {
        def importDataInstance = ImportData.get(params.id)
        if (!importDataInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "list")
            return
        }

        [importDataInstance: importDataInstance]
    }

    def edit() {
        def importDataInstance = ImportData.get(params.id)
        if (!importDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "list")
            return
        }

        [importDataInstance: importDataInstance]
    }

    def update() {
        def importDataInstance = ImportData.get(params.id)
        if (!importDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (importDataInstance.version > version) {
                importDataInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'importData.label', default: 'ImportData')] as Object[],
                          "Another user has updated this ImportData while you were editing")
                render(view: "edit", model: [importDataInstance: importDataInstance])
                return
            }
        }

        importDataInstance.properties = params

        if (!importDataInstance.save(flush: true)) {
            render(view: "edit", model: [importDataInstance: importDataInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'importData.label', default: 'ImportData'), importDataInstance.id])
        redirect(action: "show", id: importDataInstance.id)
    }

    def delete() {
        def importDataInstance = ImportData.get(params.id)
        if (!importDataInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "list")
            return
        }

        try {
            importDataInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'importData.label', default: 'ImportData'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
