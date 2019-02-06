//
//  ViewNode.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

/// A node that wrap around any content that is renderable
///
///     Div(content: "Some text") // <div>Some text</div>
public class ViewNode: ViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "div" // <div>...</div>
    ///     nodeName = "p" // <p>...</p>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
    var attributes: [ViewNodeAttribute]

    /// The content to be wrapped
    ///
    ///     content = "Some text" // <...>Some text</...>
    var content: ViewRenderable?

    init(nodeName: String, attributes: [ViewNodeAttribute] = [], content: ViewRenderable? = nil) {
        self.nodeName = nodeName
        self.attributes = attributes
        self.content = content
    }
}


/// Makes the nodee renderable
extension ViewNode {
    public func render() throws -> String {
        if let content = content {
            return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render())</\(nodeName)>"
        } else {
            return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
        }
    }
}

extension ViewRenderable {
    public static func forEach<T>(_ collection: [T], render: (Int, T) -> ViewRenderable) -> [ViewRenderable] {
        return collection.enumerated().map { render($0.offset, $0.element) }
    }
}

extension ViewNode {

    public static func forEach<T>(_ collection: [T], render: (Int, T) -> ViewNode) -> [ViewNode] {
        return collection.enumerated().map { render($0.offset, $0.element) }
    }

    public static func logic(_ closure: @escaping () -> ViewNode) -> ViewNode {
        return closure()
    }

    public static func body(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "body", attributes: attributes, content: node)
    }

    public static func head(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "head", attributes: attributes, content: node)
    }

    public static func p(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "p", attributes: attributes, content: node)
    }

    public static func html(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: node)
    }

    public static func div(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: node)
    }

    public static func h1(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: node)
    }

    public static func h2(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: node)
    }

    public static func h3(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: node)
    }

    public static func h4(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: node)
    }

    public static func h5(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: node)
    }

    public static func h6(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: node)
    }

    public static func span(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: node)
    }

    public static func i(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: node)
    }

    public static func b(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: node)
    }

    public static func ol(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: node)
    }

    public static func ul(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: node)
    }

    public static func li(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: node)
    }
}


extension ViewNode {

    public static func title(_ content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "title", content: content)
    }

    public static func script(src: String, attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "script", attributes: [.src(src)] + attributes, content: "")
    }
    
    public static func p(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "p", content: content)
    }

    public static func html(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: content)
    }

    public static func div(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: content)
    }

    public static func h1(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: content)
    }

    public static func h2(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: content)
    }

    public static func h3(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: content)
    }

    public static func h4(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: content)
    }

    public static func h5(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: content)
    }

    public static func h6(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: content)
    }

    public static func span(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: content)
    }

    public static func i(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: content)
    }

    public static func b(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: content)
    }

    public static func ol(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: content)
    }

    public static func ul(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: content)
    }

    public static func li(_ attributes: ViewNodeAttribute..., content: ViewRenderable) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: content)
    }
}


extension ViewNode {

    public static func body(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "body", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func head(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "head", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func p(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "p", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func html(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func div(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h1(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h2(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h3(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h4(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h5(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func h6(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func span(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func i(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func b(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func ol(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func ul(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: nodes as [ViewRenderable])
    }

    public static func li(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: nodes as [ViewRenderable])
    }
}




extension ViewNode {

    public static func stylesheet(href: String) -> ViewNode {
        return ViewNode.link(.rel("stylesheet"), .href(href))
    }

    public static func link(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "link", attributes: attributes)
    }

    public static func meta(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "meta", attributes: attributes)
    }

    public static func img(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "img", attributes: attributes)
    }
}
