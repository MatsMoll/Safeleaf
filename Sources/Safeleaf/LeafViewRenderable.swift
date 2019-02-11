//
//  ViewRenderable.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation


public typealias RenderedView = String

/// A protocol making a class able to render a html view
public protocol LeafViewRenderable {

    /// Renders a view
    ///
    /// - Returns: A renedred view
    func render() throws -> RenderedView
}

extension Array: LeafViewRenderable where Element == LeafViewRenderable {
    public func render() throws -> String {
        return try self.reduce("") { try $0 + $1.render() }
    }
}

extension String: LeafViewRenderable {
    public func render() -> String {
        return self
    }
}
