//
//  MainPresenterTest.swift
//  SearchMovie-MVPTests
//
//  Created by George Weaver on 07.06.2023.
//

import XCTest
@testable import SearchMovie_MVP

class MockView: MainViewInput {
    func success() {
        //
    }
    
    func failure(_ error: Error) {
        //
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var model: Comment!
    var networkService: NetworkService!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockView()
        model = Comment(postId: 0, id: 0, name: "Baz", email: "Bar", body: "Foo")
        networkService = NetworkService()
        presenter = MainPresenter(view: view, networkService: networkService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        model = nil
        networkService = nil
        presenter = nil
    }
    
    func testModuleIsNotNill() {
        XCTAssertNotNil(view, "view isn't nil")
        XCTAssertNotNil(model, "model isn't nil")
        XCTAssertNotNil(presenter, "presenter isn't nil")
    }
    
    func testView() {
    }
    
    func testModel() {
        XCTAssertEqual(model.postId, 0)
        XCTAssertEqual(model.id, 0)
        XCTAssertEqual(model.name, "Baz")
        XCTAssertEqual(model.email, "Bar")
        XCTAssertEqual(model.body, "Foo")
    }

}
