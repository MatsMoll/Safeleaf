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
public class LeafViewContentNode: LeafViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "div" // <div>...</div>
    ///     nodeName = "p" // <p>...</p>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
    var attributes: [LeafViewNodeAttribute]

    /// The content to be wrapped
    ///
    ///     content = "Some text" // <...>Some text</...>
    var content: LeafViewRenderable

    init(nodeName: String, attributes: [LeafViewNodeAttribute] = [], content: LeafViewRenderable) {
        self.nodeName = nodeName
        self.attributes = attributes
        self.content = content
    }
}


/// Makes the node renderable
extension LeafViewContentNode {
    public func render() throws -> String {
        return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render())</\(nodeName)>"
    }
}



/// A node that wrap around any content that is renderable
///
///     ViewDataNode(nodeName: "img", attributes: [.src("url")]) // <img src="url"/>
public class LeafViewDataNode: LeafViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "img" // <img .../>
    ///     nodeName = "link" // <link .../>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
    var attributes: [LeafViewNodeAttribute]

    init(nodeName: String, attributes: [LeafViewNodeAttribute]) {
        self.nodeName = nodeName
        self.attributes = attributes
    }
}


/// Makes the node renderable
extension LeafViewDataNode {
    public func render() -> String {
        return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
    }
}
