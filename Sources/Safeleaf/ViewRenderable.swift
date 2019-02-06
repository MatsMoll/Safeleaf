//
//  ViewRenderable.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation


typealias RenderedView = String

/// A protocol making a class able to render a html view
protocol ViewRenderable {

    /// Renders a view
    ///
    /// - Returns: A renedred view
    func render() throws -> RenderedView
}


/// A protocol making some situations easier
///
///     ForEach.inCollection(...)
protocol ViewRenderInitable: ViewRenderable {

    associatedtype ContentType

    init(content: ContentType)
}


struct HTMLDocument: ViewRenderable {

    let head: Head
    let body: Body

    func render() throws -> RenderedView {
        return try "<!DOCTYPE html>"
            + head.render()
            + body.render()
    }
}




extension Array: ViewRenderable where Element == ViewRenderable {
    func render() throws -> String {
        return try self.reduce("") { try $0 + $1.render() }
    }
}

extension Array {
    func render<V: ViewRenderInitable>(with view: V.Type) -> [ViewRenderable] where V.ContentType == Element {
        return self.map { view.init(content: $0) }
    }
}

extension String: ViewRenderable {
    func render() -> String {
        return self
    }
}
