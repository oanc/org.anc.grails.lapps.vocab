package org.anc.grails.lapps.vocab

import org.anc.lapps.vocab.dsl.ElementDelegate
import org.anc.lapps.vocab.dsl.PropertyDelegate
import org.anc.lapps.vocab.dsl.VocabDsl

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ElementController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    VocabService vocabService

    def parse() {
        vocabService.parse()
//        compile()
        flash.message = "Parsed the LAPPS Vocabulary DSL."
        redirect action:'index'
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        respond Element.list(params), model:[elementInstanceCount: Element.count()]
    }

    def show(Element elementInstance) {
        respond elementInstance
    }

    def create() {
        respond new Element(params)
    }

    @Transactional
    def save(Element elementInstance) {
        if (elementInstance == null) {
            notFound()
            return
        }

        if (elementInstance.hasErrors()) {
            respond elementInstance.errors, view:'create'
            return
        }

        elementInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])
                redirect elementInstance
            }
            '*' { respond elementInstance, [status: CREATED] }
        }
    }

    def edit(Element elementInstance) {
        respond elementInstance
    }

    @Transactional
    def update(Element elementInstance) {
        if (elementInstance == null) {
            notFound()
            return
        }

        if (elementInstance.hasErrors()) {
            respond elementInstance.errors, view:'edit'
            return
        }

        elementInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])
                redirect elementInstance
            }
            '*'{ respond elementInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Element elementInstance) {

        if (elementInstance == null) {
            notFound()
            return
        }

        elementInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
