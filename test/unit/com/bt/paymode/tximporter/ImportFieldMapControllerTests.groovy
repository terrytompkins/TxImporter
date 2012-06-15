package com.bt.paymode.tximporter



import org.junit.*
import grails.test.mixin.*

@TestFor(ImportFieldMapController)
@Mock(ImportFieldMap)
class ImportFieldMapControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/importFieldMap/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.importFieldMapInstanceList.size() == 0
        assert model.importFieldMapInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.importFieldMapInstance != null
    }

    void testSave() {
        controller.save()

        assert model.importFieldMapInstance != null
        assert view == '/importFieldMap/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/importFieldMap/show/1'
        assert controller.flash.message != null
        assert ImportFieldMap.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMap/list'


        populateValidParams(params)
        def importFieldMap = new ImportFieldMap(params)

        assert importFieldMap.save() != null

        params.id = importFieldMap.id

        def model = controller.show()

        assert model.importFieldMapInstance == importFieldMap
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMap/list'


        populateValidParams(params)
        def importFieldMap = new ImportFieldMap(params)

        assert importFieldMap.save() != null

        params.id = importFieldMap.id

        def model = controller.edit()

        assert model.importFieldMapInstance == importFieldMap
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMap/list'

        response.reset()


        populateValidParams(params)
        def importFieldMap = new ImportFieldMap(params)

        assert importFieldMap.save() != null

        // test invalid parameters in update
        params.id = importFieldMap.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/importFieldMap/edit"
        assert model.importFieldMapInstance != null

        importFieldMap.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/importFieldMap/show/$importFieldMap.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        importFieldMap.clearErrors()

        populateValidParams(params)
        params.id = importFieldMap.id
        params.version = -1
        controller.update()

        assert view == "/importFieldMap/edit"
        assert model.importFieldMapInstance != null
        assert model.importFieldMapInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/importFieldMap/list'

        response.reset()

        populateValidParams(params)
        def importFieldMap = new ImportFieldMap(params)

        assert importFieldMap.save() != null
        assert ImportFieldMap.count() == 1

        params.id = importFieldMap.id

        controller.delete()

        assert ImportFieldMap.count() == 0
        assert ImportFieldMap.get(importFieldMap.id) == null
        assert response.redirectedUrl == '/importFieldMap/list'
    }
}
