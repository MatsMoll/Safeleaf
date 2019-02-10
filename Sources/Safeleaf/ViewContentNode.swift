//
//  ViewContentNode.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

/// A node that wrap around any content that is renderable
///
///     ViewContentNode(nodeName: "div", content: "Some text") // <div>Some text</div>
public class ViewContentNode: ViewRenderable {

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
    var content: ViewRenderable

    init(nodeName: String, attributes: [ViewNodeAttribute] = [], content: ViewRenderable) {
        self.nodeName = nodeName
        self.attributes = attributes
        self.content = content
    }
}


/// Makes the node renderable
extension ViewContentNode {
    public func render() throws -> String {
        return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render())</\(nodeName)>"
    }
}



/// A node that wrap around any content that is renderable
///
///     ViewDataNode(nodeName: "img", attributes: [.src("url")]) // <img src="url"/>
public class ViewDataNode: ViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "img" // <img .../>
    ///     nodeName = "link" // <link .../>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
    var attributes: [ViewNodeAttribute]

    init(nodeName: String, attributes: [ViewNodeAttribute]) {
        self.nodeName = nodeName
        self.attributes = attributes
    }
}


/// Makes the node renderable
extension ViewDataNode {
    public func render() -> String {
        return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
    }
}
