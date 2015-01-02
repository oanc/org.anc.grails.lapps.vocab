package org.anc.grails.lapps.vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PropertyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        respond Property.list(params), model:[propertyInstanceCount: Property.count()]
    }

    def show(Property propertyInstance) {
        respond propertyInstance
    }

    def create() {
        respond new Property(params)
    }

    @Transactional
    def save(Property propertyInstance) {
        if (propertyInstance == null) {
            notFound()
            return
        }

        if (propertyInstance.hasErrors()) {
            respond propertyInstance.errors, view:'create'
            return
        }

        propertyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'property.label', default: 'Property'), propertyInstance.id])
                redirect propertyInstance
            }
            '*' { respond propertyInstance, [status: CREATED] }
        }
    }

    def edit(Property propertyInstance) {
        respond propertyInstance
    }

    @Transactional
    def update(Property propertyInstance) {
        if (propertyInstance == null) {
            notFound()
            return
        }

        if (propertyInstance.hasErrors()) {
            respond propertyInstance.errors, view:'edit'
            return
        }

        propertyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'property.label', default: 'Property'), propertyInstance.id])
                redirect propertyInstance
            }
            '*'{ respond propertyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Property propertyInstance) {

        if (propertyInstance == null) {
            notFound()
            return
        }

        propertyInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'property.label', default: 'Property'), propertyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'property.label', default: 'Property'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
