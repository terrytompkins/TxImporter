package com.bt.paymode.tximporter

import org.springframework.dao.DataIntegrityViolationException

class CompanyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [companyInstanceList: Company.list(params), companyInstanceTotal: Company.count()]
    }

    def create() {
        [companyInstance: new Company(params)]
    }

    def save() {
        def companyInstance = new Company(params)
        if (!companyInstance.save(flush: true)) {
            render(view: "create", model: [companyInstance: companyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def show() {
        def companyInstance = Company.get(params.id)
        if (!companyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "list")
            return
        }

        [companyInstance: companyInstance]
    }

    def edit() {
        def companyInstance = Company.get(params.id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "list")
            return
        }

        [companyInstance: companyInstance]
    }

    def update() {
        def companyInstance = Company.get(params.id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'company.label', default: 'Company')] as Object[],
                          "Another user has updated this Company while you were editing")
                render(view: "edit", model: [companyInstance: companyInstance])
                return
            }
        }

        companyInstance.properties = params

        if (!companyInstance.save(flush: true)) {
            render(view: "edit", model: [companyInstance: companyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def delete() {
        def companyInstance = Company.get(params.id)
        if (!companyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "list")
            return
        }

        try {
            companyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'company.label', default: 'Company'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
