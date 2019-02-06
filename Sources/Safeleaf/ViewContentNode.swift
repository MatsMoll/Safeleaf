//
//  ViewContentNode.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

/// A node that wrap around any content that is renderable
///
///     Div(content: "Some text") // <div>Some text</div>
protocol ViewContentNode: ViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "div" // <div>...</div>
    ///     nodeName = "p" // <p>...</p>
    var nodeName: String { get }

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
    var attributes: [ViewNodeAttribute] { get }

    /// The content to be wrapped
    ///
    ///     content = "Some text" // <...>Some text</...>
    var content: ViewRenderable { get }

    /// Init a node with attributes and its content
    init(attributes: ViewNodeAttribute..., content: ViewRenderable)
}


/// Makes the nodee renderable
extension ViewContentNode {
    func render() throws -> String {
        return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render())</\(nodeName)>"
    }
}





struct Head: ViewContentNode {
    let nodeName: String = "head"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct Body: ViewContentNode {
    let nodeName: String = "body"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct Div: ViewContentNode {
    let nodeName: String = "div"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}


struct Anchor: ViewContentNode {
    let nodeName: String = "a"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}


struct ParagraphView: ViewContentNode {
    let nodeName: String = "p"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct H1View: ViewContentNode {
    let nodeName: String = "h1"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct H2View: ViewContentNode {
    let nodeName: String = "h2"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct H3View: ViewContentNode {
    let nodeName: String = "h3"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct H4View: ViewContentNode {
    let nodeName: String = "h4"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct H5View: ViewContentNode {
    let nodeName: String = "h5"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}


struct Span: ViewContentNode {

    let nodeName: String = "span"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct ButtonView: ViewContentNode {
    let nodeName: String = "button"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}

struct ItalicText: ViewContentNode {
    let nodeName: String = "i"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }
}
