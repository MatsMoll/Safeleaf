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
    static func buildLeaf() throws -> LeafViewRenderable
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

    public static func body(attributes: [LeafViewNodeAttribute] = [] , children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public static func form(attributes: [LeafViewNodeAttribute] = [] , children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public static func small(attributes: [LeafViewNodeAttribute] = [] , children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public static func footer(attributes: [LeafViewNodeAttribute] = [] , children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public static func head(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public static func p(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public static func html(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func button(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func div(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public static func h1(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public static func h2(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public static func h3(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public static func h4(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public static func h5(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public static func h6(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public static func span(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public static func i(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public static func b(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(href: String, attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public static func ol(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public static func ul(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public static func li(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public static func label(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public static func title(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public static func script(attributes: [LeafViewNodeAttribute] = [], children: LeafViewRenderable...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension LeafBuildable {
    public static func comment(_ comment: String) -> LeafViewRenderable {
        return "<!-- \(comment) -->"
    }
}


extension LeafBuildable {

    public static func stylesheet(href: String, attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public static func link(attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "link", attributes: attributes)
    }

    public static func link(href: String, attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public static func meta(attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "meta", attributes: attributes)
    }

    public static func meta(name: String, content: String, attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public static func img(attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "img", attributes: attributes)
    }

    public static func img(src: String, attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public static func input(attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewDataNode(nodeName: "input", attributes: attributes)
    }

    public static func script(attributes: LeafViewNodeAttribute...) -> LeafViewRenderable {
        return LeafViewContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}

extension LeafBuildable {
    public func build(_ view: LeafViewRenderable...) throws -> LeafViewBuilder {
        return try LeafViewBuilder(viewRenderable: view)
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
    public static func embed<T: StaticLeafView>(staticView view: T.Type) -> LeafViewRenderable {
        return "#embed(\"\(T.self)\")"
    }

    /// Embeds a template
    ///
    /// - Parameter view: The template to embed
    /// - Returns: A renderd leaf syntax embeding a view
    /// - Throws: If the view uses another variable for the content to embed, or if unable to decode the key
    public static func embed<T: LeafTemplate>(template view: T.Type) throws -> LeafViewRenderable {
        guard let embedKey = try T.reflectProperty(forKey: T.contentPath) else {
                throw LeafTemplateError.unableToFindKey
        }
        let properties = try Self.reflectProperties(depth: 0)
        let embedName = embedKey.path.reduce("") { $0 + $1 + "." }.dropLast()
        let filteredProp = properties.filter { $0.path.reduce("") { $0 + $1 + "." }.dropLast() == embedName }
        guard !filteredProp.isEmpty else {
            throw LeafTemplateError.keyMismatch
        }
        return "#embed(\"\(T.self)\")"
    }

    /// Creates a for each loop in the leaf syntax
    ///
    /// - Parameters:
    ///   - collectionKey: The key to the collection to loop
    ///   - render: The template to render
    /// - Returns: A `ViewRenderable` representing a for loop with the embeded view
    /// - Throws: If the view do not use a variable in sinfular form compared to the collection
    public static func forEach<V, T: LeafTemplate>(in collectionKey: WritableKeyPath<Self, [V]>, render: T.Type) throws -> LeafViewRenderable where T.ContentType == V {

        guard let key = try Self.reflectProperty(forKey: collectionKey),
            let embedKey = try T.reflectProperty(forKey: T.contentPath) else {
            throw LeafTemplateError.unableToFindKey
        }
        let keyName = key.path.reduce("", { $0 + $1 + "."}).dropLast()
        let embedName = embedKey.path.reduce("", { $0 + $1 + "."}).dropLast()
        guard keyName.dropLast() == embedName else {
            throw LeafTemplateError.keyMismatch
        }
        return "#for(\(keyName.dropLast()) in \(keyName)) {#embed(\"\(T.self)\")}"
    }

    /// Sets a view for a template
    ///
    /// - Parameters:
    ///   - kp: The key to the view to set
    ///   - view: The view to render
    /// - Returns: A `ViewRenderable` setting a embeded leaf view
    /// - Throws: Throws if not able to decode the key name
    public static func set<T: LeafTemplate, V: LeafViewRenderable>(for kp: WritableKeyPath<T, V>, with view: () throws -> LeafViewRenderable) throws -> LeafViewRenderable where V: ReflectionDecodable {
        guard let key = try T.reflectProperty(forKey: kp) else {
            throw LeafTemplateError.unableToFindKey
        }
        return try "#set(\"\(key.path.reduce("") { $0 + $1 + "." }.dropLast())\") {\(view().render())}"
    }

    public static func get<T: LeafViewRenderable>(_ keyPath: WritableKeyPath<Self, T>) throws -> LeafViewRenderable where T: ReflectionDecodable {
        guard let key = try Self.reflectProperty(forKey: keyPath) else {
            throw LeafTemplateError.unableToFindKey
        }
        return "#get(\(key.path.reduce("") { $0 + $1 + "." }.dropLast()))"
    }
}
