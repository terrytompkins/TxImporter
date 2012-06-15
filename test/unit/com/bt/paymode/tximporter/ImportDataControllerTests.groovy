package com.bt.paymode.tximporter



import org.junit.*
import grails.test.mixin.*

@TestFor(ImportDataController)
@Mock(ImportData)
class ImportDataControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/importData/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.importDataInstanceList.size() == 0
        assert model.importDataInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.importDataInstance != null
    }

    void testSave() {
        controller.save()

        assert model.importDataInstance != null
        assert view == '/importData/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/importData/show/1'
        assert controller.flash.message != null
        assert ImportData.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/importData/list'


        populateValidParams(params)
        def importData = new ImportData(params)

        assert importData.save() != null

        params.id = importData.id

        def model = controller.show()

        assert model.importDataInstance == importData
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/importData/list'


        populateValidParams(params)
        def importData = new ImportData(params)

        assert importData.save() != null

        params.id = importData.id

        def model = controller.edit()

        assert model.importDataInstance == importData
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/importData/list'

        response.reset()


        populateValidParams(params)
        def importData = new ImportData(params)

        assert importData.save() != null

        // test invalid parameters in update
        params.id = importData.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/importData/edit"
        assert model.importDataInstance != null

        importData.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/importData/show/$importData.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        importData.clearErrors()

        populateValidParams(params)
        params.id = importData.id
        params.version = -1
        controller.update()

        assert view == "/importData/edit"
        assert model.importDataInstance != null
        assert model.importDataInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/importData/list'

        response.reset()

        populateValidParams(params)
        def importData = new ImportData(params)

        assert importData.save() != null
        assert ImportData.count() == 1

        params.id = importData.id

        controller.delete()

        assert ImportData.count() == 0
        assert ImportData.get(importData.id) == null
        assert response.redirectedUrl == '/importData/list'
    }
}
