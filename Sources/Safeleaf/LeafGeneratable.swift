//
//  LeafGeneratable.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 08/02/2019.
//

import Foundation
import CodableKit

/// A protocol making it possible to render a leaf file
public protocol LeafRenderable {
    /// Renders a presentable view
    ///
    /// - Returns: A renderd view
    /// - Throws: If the render fails for any reason
    static func renderLeaf() throws -> RenderedView
}

/// A protocol that makes it easy to build a leaf template
public protocol LeafBuildable: ReflectableCodable, LeafRenderable {
    /// Builds a leaf template
    ///
    /// - Returns: A
    /// - Throws: If the build fails for some reason
    static func buildLeaf() throws -> ViewRenderable
}

extension LeafBuildable {
    static func renderLeaf() throws -> RenderedView {
        return try buildLeaf().render()
    }
}

/// A protocol clearifying that it will render a static view and not contain any variables
public protocol StaticLeafView: LeafBuildable { }

/// Some errors that can occure when creating a leaf file
///
/// - keyMismatch: Two keys do not match and can lead to an error
/// - unableToFindKey: Unable to decode the key name
enum LeafTemplateError: Error {
    case keyMismatch
    case unableToFindKey
}

/// A Leaf template presenting some content that can changed
public protocol LeafTemplate: LeafBuildable {

    /// The content type the template presents
    associatedtype ContentType: ReflectionDecodable

    /// The path to the content
    static var contentPath: WritableKeyPath<Self, ContentType> { get }
}


extension LeafBuildable {

    public static func body(attributes: [ViewNodeAttribute] = [] , children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public static func form(attributes: [ViewNodeAttribute] = [] , children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public static func small(attributes: [ViewNodeAttribute] = [] , children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public static func footer(attributes: [ViewNodeAttribute] = [] , children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public static func head(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public static func p(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public static func html(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func button(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func div(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public static func h1(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public static func h2(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public static func h3(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public static func h4(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public static func h5(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public static func h6(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public static func span(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public static func i(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public static func b(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(href: String, attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public static func ol(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public static func ul(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public static func li(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public static func label(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public static func title(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public static func script(attributes: [ViewNodeAttribute] = [], children: ViewRenderable...) -> ViewRenderable {
        return ViewContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension LeafBuildable {
    public static func comment(_ comment: String) -> ViewRenderable {
        return "<!-- \(comment) -->"
    }
}


extension LeafBuildable {

    public static func stylesheet(href: String, attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public static func link(attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "link", attributes: attributes)
    }

    public static func link(href: String, attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public static func meta(attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "meta", attributes: attributes)
    }

    public static func meta(name: String, content: String, attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public static func img(attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "img", attributes: attributes)
    }

    public static func img(src: String, attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public static func input(attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewDataNode(nodeName: "input", attributes: attributes)
    }

    public static func script(attributes: ViewNodeAttribute...) -> ViewRenderable {
        return ViewContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}

extension LeafBuildable {
    public func build(_ view: ViewRenderable...) throws -> ViewBuilder {
        return try ViewBuilder(viewRenderable: view)
    }
}


extension LeafBuildable {
    /// Sets a variable in the leaf
    ///
    /// - Parameter keyPath: The variable to set
    /// - Returns: A leaf syntax setting a placeholder for a variable
    /// - Throws: If unable to decode the variable name
    public static func variable<V: ReflectionDecodable>(_ keyPath: WritableKeyPath<Self, V>) throws -> String {
        guard let key = try Self.reflectProperty(forKey: keyPath) else {
            throw LeafTemplateError.unableToFindKey
        }
        return "#(\(key.path.reduce("") { $0 + $1 + "." }.dropLast()))"
    }

    /// Embeds a view with no safy checking
    ///
    /// - Parameter view: The view to embed
    /// - Returns: A leaf syntax embeding a view
    public static func embed<T: StaticLeafView>(staticView view: T.Type) -> ViewRenderable {
        return "#embed(\(T.self))"
    }

    /// Embeds a template
    ///
    /// - Parameter view: The template to embed
    /// - Returns: A renderd leaf syntax embeding a view
    /// - Throws: If the view uses another variable for the content to embed, or if unable to decode the key
    public static func embed<T: LeafTemplate>(template view: T.Type) throws -> ViewRenderable {
        guard let embedKey = try T.reflectProperty(forKey: T.contentPath) else {
                throw LeafTemplateError.unableToFindKey
        }
        let properties = try Self.reflectProperties(depth: 0)
        let embedName = embedKey.path.reduce("") { $0 + $1 + "." }.dropLast()
        let filteredProp = properties.filter { $0.path.reduce("") { $0 + $1 + "." }.dropLast() == embedName }
        guard !filteredProp.isEmpty else {
            throw LeafTemplateError.keyMismatch
        }
        return "#embed(\(T.self))"
    }

    /// Creates a for each loop in the leaf syntax
    ///
    /// - Parameters:
    ///   - collectionKey: The key to the collection to loop
    ///   - render: The template to render
    /// - Returns: A `ViewRenderable` representing a for loop with the embeded view
    /// - Throws: If the view do not use a variable in sinfular form compared to the collection
    public static func forEach<V, T: LeafTemplate>(in collectionKey: WritableKeyPath<Self, [V]>, render: T.Type) throws -> ViewRenderable where T.ContentType == V {

        guard let key = try Self.reflectProperty(forKey: collectionKey),
            let embedKey = try T.reflectProperty(forKey: T.contentPath) else {
            throw LeafTemplateError.unableToFindKey
        }
        let keyName = key.path.reduce("", { $0 + $1 + "."}).dropLast()
        let embedName = embedKey.path.reduce("", { $0 + $1 + "."}).dropLast()
        guard keyName.dropLast() == embedName else {
            throw LeafTemplateError.keyMismatch
        }
        return "#for(\(keyName.dropLast()) in \(keyName)) {#embed(\(T.self))}"
    }

    /// Sets a view for a template
    ///
    /// - Parameters:
    ///   - kp: The key to the view to set
    ///   - view: The view to render
    /// - Returns: A `ViewRenderable` setting a embeded leaf view
    /// - Throws: Throws if not able to decode the key name
    public static func set<T: LeafTemplate, V: ViewRenderable>(for kp: WritableKeyPath<T, V>, with view: () -> ViewRenderable) throws -> ViewRenderable where V: ReflectionDecodable {
        guard let key = try T.reflectProperty(forKey: kp) else {
            throw LeafTemplateError.unableToFindKey
        }
        return try "#set(\"\(key.path.reduce("") { $0 + $1 + "." }.dropLast())\") {\(view().render())}"
    }

    public static func get<T: ViewRenderable>(_ keyPath: WritableKeyPath<Self, T>) throws -> ViewRenderable where T: ReflectionDecodable {
        guard let key = try Self.reflectProperty(forKey: keyPath) else {
            throw LeafTemplateError.unableToFindKey
        }
        return "#get(\(key.path.reduce("") { $0 + $1 + "." }.dropLast()))"
    }
}
