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
class ViewNode: ViewRenderable {

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
    func render() throws -> String {
        if let content = content {
            return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render())</\(nodeName)>"
        } else {
            return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
        }
    }
}



extension ViewNode {

    static func logic(_ closure: @escaping () -> ViewNode) -> ViewNode {
        return closure()
    }

    static func body(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "body", attributes: attributes, content: node)
    }

    static func head(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "head", attributes: attributes, content: node)
    }

    static func p(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "p", attributes: attributes, content: node)
    }

    static func html(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: node)
    }

    static func div(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: node)
    }

    static func h1(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: node)
    }

    static func h2(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: node)
    }

    static func h3(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: node)
    }

    static func h4(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: node)
    }

    static func h5(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: node)
    }

    static func h6(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: node)
    }

    static func span(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: node)
    }

    static func i(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: node)
    }

    static func b(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: node)
    }

    static func ol(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: node)
    }

    static func ul(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: node)
    }

    static func li(_ attributes: ViewNodeAttribute..., node: ViewNode) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: node)
    }
}


extension ViewNode {

    static func title(_ value: String) -> ViewNode {
        return ViewNode(nodeName: "title", content: value)
    }
    
    static func p(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "p", content: value)
    }

    static func html(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: value)
    }

    static func div(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: value)
    }

    static func h1(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: value)
    }

    static func h2(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: value)
    }

    static func h3(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: value)
    }

    static func h4(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: value)
    }

    static func h5(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: value)
    }

    static func h6(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: value)
    }

    static func span(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: value)
    }

    static func i(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: value)
    }

    static func b(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: value)
    }

    static func ol(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: value)
    }

    static func ul(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: value)
    }

    static func li(_ attributes: ViewNodeAttribute..., value: String) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: value)
    }
}


extension ViewNode {

    static func body(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "body", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func head(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "head", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func p(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "p", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func html(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "html", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func div(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "div", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h1(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h1", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h2(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h2", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h3(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h3", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h4(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h4", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h5(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h5", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func h6(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "h6", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func span(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "span", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func i(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "i", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func b(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "b", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func ol(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "ol", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func ul(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "ul", attributes: attributes, content: nodes as [ViewRenderable])
    }

    static func li(_ attributes: ViewNodeAttribute..., nodes: [ViewNode]) -> ViewNode {
        return ViewNode(nodeName: "li", attributes: attributes, content: nodes as [ViewRenderable])
    }
}




extension ViewNode {

    static func stylesheet(href: String) -> ViewNode {
        return ViewNode.link(.rel("stylesheet"), .href(href))
    }

    static func link(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "link", attributes: attributes)
    }

    static func meta(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "meta", attributes: attributes)
    }

    static func img(_ attributes: ViewNodeAttribute...) -> ViewNode {
        return ViewNode(nodeName: "img", attributes: attributes)
    }
}
