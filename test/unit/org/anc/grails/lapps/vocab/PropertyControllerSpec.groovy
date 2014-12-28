package org.anc.grails.lapps.vocab



import grails.test.mixin.*
import spock.lang.*

@TestFor(PropertyController)
@Mock(Property)
class PropertyControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.propertyInstanceList
            model.propertyInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.propertyInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def property = new Property()
            property.validate()
            controller.save(property)

        then:"The create view is rendered again with the correct model"
            model.propertyInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            property = new Property(params)

            controller.save(property)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/property/show/1'
            controller.flash.message != null
            Property.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def property = new Property(params)
            controller.show(property)

        then:"A model is populated containing the domain instance"
            model.propertyInstance == property
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def property = new Property(params)
            controller.edit(property)

        then:"A model is populated containing the domain instance"
            model.propertyInstance == property
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/property/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def property = new Property()
            property.validate()
            controller.update(property)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.propertyInstance == property

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            property = new Property(params).save(flush: true)
            controller.update(property)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/property/show/$property.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/property/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def property = new Property(params).save(flush: true)

        then:"It exists"
            Property.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(property)

        then:"The instance is deleted"
            Property.count() == 0
            response.redirectedUrl == '/property/index'
            flash.message != null
    }
}
