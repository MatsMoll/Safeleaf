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


extension Array: ViewRenderable where Element == ViewRenderable {
    func render() throws -> String {
        return try self.reduce("") { try $0 + $1.render() }
    }
}

extension String: ViewRenderable {
    func render() -> String {
        return self
    }
}
