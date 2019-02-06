//
//  ViewDataNode.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

/// A node that contains any type of data
///
///     Image(...) // <img .../>
///     Link(...) // <link .../>
///     Input(...) // <input .../>
protocol ViewDataNode: ViewRenderable {

    /// The name of the type of node
    ///
    ///     nodeName = "link" // <link .../>
    ///     nodeName = "img" // <img .../>
    var nodeName: String { get }

    /// The attributes in an node
    ///
    ///     attributes = [.src("some url")] // <`nodeName` src="some url">
    var attributes: [ViewNodeAttribute] { get }

    /// Init a node with its attribute data
    init(attributes: ViewNodeAttribute...)
}

/// Makes the node renderable
extension ViewDataNode {
    func render() -> String {
        return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
    }
}



struct HeaderMetadata: ViewDataNode {

    let nodeName: String = "meta"
    let attributes: [ViewNodeAttribute]

    init(attributes: ViewNodeAttribute...) {
        self.attributes = attributes
    }

    static func charset(_ value: String.Encoding) -> HeaderMetadata {
        return HeaderMetadata(attributes: .charset(value))
    }

    static func content(_ content: String, forName name: String) -> HeaderMetadata {
        return HeaderMetadata(attributes:
            .name(name),
                              .content(content)
        )
    }
}


struct HeaderLink: ViewDataNode {

    let nodeName: String = "link"
    let attributes: [ViewNodeAttribute]

    init(attributes: ViewNodeAttribute...) {
        self.attributes = attributes
    }

    static func stylesheet(href: String) -> HeaderLink {
        return HeaderLink(attributes:
            .rel("stylesheet"),
                          .href(href),
                          .type("text/css")
        )
    }
}


struct HeaderScript: ViewContentNode {

    let nodeName: String = "script"
    let attributes: [ViewNodeAttribute]
    let content: ViewRenderable

    init(attributes: ViewNodeAttribute..., content: ViewRenderable) {
        self.attributes = attributes
        self.content = content
    }


    static func linked(_ source: String) -> HeaderScript {
        return HeaderScript(attributes: .src(source),
                            content: "")
    }

    static func customScript(_ script: String) -> HeaderScript {
        return HeaderScript(content: script)
    }
}
