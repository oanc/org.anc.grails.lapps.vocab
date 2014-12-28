package grailshtmlgen


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UriController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = Uri

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Uri.list(params), model: [uriInstanceCount: Uri.count()]
    }

    def show(Uri uriInstance) {
        respond uriInstance
    }

    def create() {
        respond new Uri(params)
    }

    @Transactional
    def save(Uri uriInstance) {
        if (uriInstance == null) {
            notFound()
            return
        }

        if (uriInstance.hasErrors()) {
            respond uriInstance.errors, view: 'create'
            return
        }

        uriInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'uriInstance.label', default: 'Uri'), uriInstance.id])
                redirect uriInstance
            }
            '*' { respond uriInstance, [status: CREATED] }
        }
    }

    def edit(Uri uriInstance) {
        respond uriInstance
    }

    @Transactional
    def update(Uri uriInstance) {
        if (uriInstance == null) {
            notFound()
            return
        }

        if (uriInstance.hasErrors()) {
            respond uriInstance.errors, view: 'edit'
            return
        }

        uriInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Uri.label', default: 'Uri'), uriInstance.id])
                redirect uriInstance
            }
            '*' { respond uriInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Uri uriInstance) {

        if (uriInstance == null) {
            notFound()
            return
        }

        uriInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Uri.label', default: 'Uri'), uriInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'uriInstance.label', default: 'Uri'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
