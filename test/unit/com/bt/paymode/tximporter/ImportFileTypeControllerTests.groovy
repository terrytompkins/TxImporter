package com.bt.paymode.tximporter



import org.junit.*
import grails.test.mixin.*

@TestFor(ImportFileTypeController)
@Mock(ImportFileType)
class ImportFileTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/importFileType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.importFileTypeInstanceList.size() == 0
        assert model.importFileTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.importFileTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.importFileTypeInstance != null
        assert view == '/importFileType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/importFileType/show/1'
        assert controller.flash.message != null
        assert ImportFileType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/importFileType/list'


        populateValidParams(params)
        def importFileType = new ImportFileType(params)

        assert importFileType.save() != null

        params.id = importFileType.id

        def model = controller.show()

        assert model.importFileTypeInstance == importFileType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/importFileType/list'


        populateValidParams(params)
        def importFileType = new ImportFileType(params)

        assert importFileType.save() != null

        params.id = importFileType.id

        def model = controller.edit()

        assert model.importFileTypeInstance == importFileType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/importFileType/list'

        response.reset()


        populateValidParams(params)
        def importFileType = new ImportFileType(params)

        assert importFileType.save() != null

        // test invalid parameters in update
        params.id = importFileType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/importFileType/edit"
        assert model.importFileTypeInstance != null

        importFileType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/importFileType/show/$importFileType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        importFileType.clearErrors()

        populateValidParams(params)
        params.id = importFileType.id
        params.version = -1
        controller.update()

        assert view == "/importFileType/edit"
        assert model.importFileTypeInstance != null
        assert model.importFileTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/importFileType/list'

        response.reset()

        populateValidParams(params)
        def importFileType = new ImportFileType(params)

        assert importFileType.save() != null
        assert ImportFileType.count() == 1

        params.id = importFileType.id

        controller.delete()

        assert ImportFileType.count() == 0
        assert ImportFileType.get(importFileType.id) == null
        assert response.redirectedUrl == '/importFileType/list'
    }
}
