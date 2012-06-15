package com.bt.paymode.tximporter



import org.junit.*
import grails.test.mixin.*

@TestFor(ImportFieldMapElementController)
@Mock(ImportFieldMapElement)
class ImportFieldMapElementControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/importFieldMapElement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.importFieldMapElementInstanceList.size() == 0
        assert model.importFieldMapElementInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.importFieldMapElementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.importFieldMapElementInstance != null
        assert view == '/importFieldMapElement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/importFieldMapElement/show/1'
        assert controller.flash.message != null
        assert ImportFieldMapElement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMapElement/list'


        populateValidParams(params)
        def importFieldMapElement = new ImportFieldMapElement(params)

        assert importFieldMapElement.save() != null

        params.id = importFieldMapElement.id

        def model = controller.show()

        assert model.importFieldMapElementInstance == importFieldMapElement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMapElement/list'


        populateValidParams(params)
        def importFieldMapElement = new ImportFieldMapElement(params)

        assert importFieldMapElement.save() != null

        params.id = importFieldMapElement.id

        def model = controller.edit()

        assert model.importFieldMapElementInstance == importFieldMapElement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMapElement/list'

        response.reset()


        populateValidParams(params)
        def importFieldMapElement = new ImportFieldMapElement(params)

        assert importFieldMapElement.save() != null

        // test invalid parameters in update
        params.id = importFieldMapElement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/importFieldMapElement/edit"
        assert model.importFieldMapElementInstance != null

        importFieldMapElement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/importFieldMapElement/show/$importFieldMapElement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        importFieldMapElement.clearErrors()

        populateValidParams(params)
        params.id = importFieldMapElement.id
        params.version = -1
        controller.update()

        assert view == "/importFieldMapElement/edit"
        assert model.importFieldMapElementInstance != null
        assert model.importFieldMapElementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMapElement/list'

        response.reset()

        populateValidParams(params)
        def importFieldMapElement = new ImportFieldMapElement(params)

        assert importFieldMapElement.save() != null
        assert ImportFieldMapElement.count() == 1

        params.id = importFieldMapElement.id

        controller.delete()

        assert ImportFieldMapElement.count() == 0
        assert ImportFieldMapElement.get(importFieldMapElement.id) == null
        assert response.redirectedUrl == '/importFieldMapElement/list'
    }
}
