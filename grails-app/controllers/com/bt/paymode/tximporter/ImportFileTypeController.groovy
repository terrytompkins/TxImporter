package com.bt.paymode.tximporter

import org.springframework.dao.DataIntegrityViolationException

class ImportFileTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [importFileTypeInstanceList: ImportFileType.list(params), importFileTypeInstanceTotal: ImportFileType.count()]
    }

    def create() {
        [importFileTypeInstance: new ImportFileType(params)]
    }

    def save() {
        def importFileTypeInstance = new ImportFileType(params)
        if (!importFileTypeInstance.save(flush: true)) {
            render(view: "create", model: [importFileTypeInstance: importFileTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), importFileTypeInstance.id])
        redirect(action: "show", id: importFileTypeInstance.id)
    }

    def show() {
        def importFileTypeInstance = ImportFileType.get(params.id)
        if (!importFileTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "list")
            return
        }

        [importFileTypeInstance: importFileTypeInstance]
    }

    def edit() {
        def importFileTypeInstance = ImportFileType.get(params.id)
        if (!importFileTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "list")
            return
        }

        [importFileTypeInstance: importFileTypeInstance]
    }

    def update() {
        def importFileTypeInstance = ImportFileType.get(params.id)
        if (!importFileTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (importFileTypeInstance.version > version) {
                importFileTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'importFileType.label', default: 'ImportFileType')] as Object[],
                          "Another user has updated this ImportFileType while you were editing")
                render(view: "edit", model: [importFileTypeInstance: importFileTypeInstance])
                return
            }
        }

        importFileTypeInstance.properties = params

        if (!importFileTypeInstance.save(flush: true)) {
            render(view: "edit", model: [importFileTypeInstance: importFileTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), importFileTypeInstance.id])
        redirect(action: "show", id: importFileTypeInstance.id)
    }

    def delete() {
        def importFileTypeInstance = ImportFileType.get(params.id)
        if (!importFileTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            importFileTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'importFileType.label', default: 'ImportFileType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
