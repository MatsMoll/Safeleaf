import XCTest
@testable import Safeleaf


final class SafeleafTests: XCTestCase {

    func testSimpleNode() throws {
        try boilerplateTestCase(SimpleView.self)
    }

    func testNestedNode() throws {
        try boilerplateTestCase(NestedView.self)
    }

    func testSimpleTemplate() throws {
        try boilerplateTestCase(SimpleTemplate.self)
    }

    func testEmbedStaticView() throws {
        try boilerplateTestCase(EmbedingStaticView.self)
    }

    func testBaseTemplate() throws {
        try boilerplateTestCase(BaseTemplate.self)
    }

    func testForEachTemplate() throws {
        try boilerplateTestCase(ForEachViewTest.self)
    }

    func testEmbedTemplate() throws {
        try boilerplateTestCase(UsingBaseTemplate.self)
    }


    func boilerplateTestCase<T: LeafTestable>(_ type: T.Type) throws {
        let render = try T.renderLeaf()
        XCTAssertTrue(render == T.expexted, "Render: \n\(render)\n- Did not match the expexted result")
    }


    static let allTests = [
        ("testSimpleNode", testSimpleNode),
        ("testNestedNode", testNestedNode),
        ("testSimpleTemplate", testSimpleTemplate),
        ("testEmbedStaticView", testEmbedStaticView),
        ("testBaseTemplate", testBaseTemplate),
        ("testEmbedTemplate", testEmbedTemplate)
    ]
}
