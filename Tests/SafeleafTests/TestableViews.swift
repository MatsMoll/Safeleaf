//
//  TestableViews.swift
//  SafeleafTests
//
//  Created by Mats Mollestad on 09/02/2019.
//

@testable import Safeleaf
import CodableKit

protocol LeafTestable: LeafRenderable {
    static var expexted: String { get }
}

final class SimpleView: StaticLeafView, LeafTestable {

    static let expexted = "<div id='Test' class='some-class'>Hello</div>"

    static func buildLeaf() throws -> ViewRenderable {
        return
            div(attributes: [.id("Test"), .class("some-class")], children: "Hello")
    }
}

final class NestedView: StaticLeafView, LeafTestable {

    static let expexted = "<div><h1>Title</h1><p>Text</p></div>"

    static func buildLeaf() throws -> ViewRenderable {
        return
            div(children:
                h1(children: "Title"),
                p(children: "Text")
        )
    }
}


final class SimpleTemplate: LeafTemplate, LeafTestable {

    static let expexted = "<div><h1>#(content.title)</h1><p>#(content.description)</p></div>"

    static var contentPath: WritableKeyPath<SimpleTemplate, SimpleData> = \.content

    var content: SimpleData!

    static func buildLeaf() throws -> ViewRenderable {
        return try
            div(children:
                h1(children: variable(\.content.title)),
                p(children: variable(\.content.description))
        )
    }
}


final class EmbedingStaticView: LeafTemplate, ReflectableCodable, LeafTestable {

    static let expexted = "<div><h1>#(simpleData.title)</h1>#embed(SimpleView)</div>"

    static let contentPath: WritableKeyPath<EmbedingStaticView, SimpleData> = \.simpleData

    var simpleData: SimpleData!

    static func buildLeaf() throws -> ViewRenderable {
        return try
            div(children:
                h1(children: variable(\.simpleData.title)),
                embed(staticView: SimpleView.self)
        )
    }
}


struct BaseTemplateView: ReflectableCodable, ReflectionDecodableObject {
    static var leftExample = BaseTemplateView(extraHeader: .empty, content: .empty)
    static var rightExample = BaseTemplateView(extraHeader: .one, content: .one)

    var extraHeader: ViewBuilder
    var content: ViewBuilder
}


final class BaseTemplate: LeafTemplate, LeafTestable {
    static var expexted: String = "<html><head><title>#(content.title)</title><meta name='description' content='#(content.description)'/>#get(views.extraHeader)</head><body>#get(views.content)</body></html>"

    static var contentPath: WritableKeyPath<BaseTemplate, SimpleData> = \.content

    var content: SimpleData!
    var views: BaseTemplateView!


    static func buildLeaf() throws -> ViewRenderable {
        return try
            html(children:
                head(children:
                    title(children: variable(\.content.title)),
                     meta(attributes: .name("description"), .content(variable(\.content.description))),
                     get(\.views.extraHeader)
                ),
                 body(children:
                    get(\.views.content)
                )
        )
    }
}


final class UsingBaseTemplate: LeafBuildable, LeafTestable {

    static var expexted: String = "#set(\"views.extraHeader\") {<link href='some-url'/>}#set(\"views.content\") {<h1>Some title</h1>}#embed(BaseTemplate)"

    let content: SimpleData

    static func buildLeaf() throws -> ViewRenderable {
        return try [
            set(for: \BaseTemplate.views.extraHeader) {
                link(href: "some-url")
            },
            set(for: \BaseTemplate.views.content) {
                h1(children: "Some title")
            },
            embed(template: BaseTemplate.self)
        ]
    }
}


struct SimpleData: ReflectableCodable, ReflectionDecodableObject {

    static var leftExample = SimpleData(title: "0", description: "0")
    static var rightExample = SimpleData(title: "1", description: "1")

    var title: String
    var description: String
}


final class ForEachViewTest: LeafBuildable, LeafTestable {
    static let expexted: String = "<div>#for(simpleData in simpleDatas) {#embed(EmbedingStaticView)}</div>"

    var simpleDatas: [SimpleData]

    static func buildLeaf() throws -> ViewRenderable {
        return try
            div(children:
                forEach(in: \.simpleDatas, render: EmbedingStaticView.self)
        )
    }
}
