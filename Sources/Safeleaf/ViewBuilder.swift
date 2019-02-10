//
//  ViewBuilder.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 07/02/2019.
//

import Foundation
import CodableKit


public typealias ReflectableCodable = Reflectable & Codable

public protocol ReflectionDecodableObject: ReflectionDecodable, Equatable {
    static var leftExample: Self { get }
    static var rightExample: Self { get }
}

extension ReflectionDecodableObject {
    static func reflectDecoded() -> (Self, Self) {
        return (Self.leftExample, Self.rightExample)
    }

    static func reflectDecodedIsLeft(_ item: Self) -> Bool {
        return item == Self.leftExample
    }
}


final public class ViewBuilder: ViewRenderable, ReflectionDecodable, Codable, Equatable {

    public static func == (lhs: ViewBuilder, rhs: ViewBuilder) -> Bool {
        return lhs.renderedView == rhs.renderedView
    }

    public static let empty = try! ViewBuilder(viewRenderable: "0")
    public static let one = try! ViewBuilder(viewRenderable: "1")

    public static func reflectDecoded() -> (ViewBuilder, ViewBuilder) {
        return try! (ViewBuilder(viewRenderable: "0"), ViewBuilder(viewRenderable: "1"))
    }

    public static func reflectDecodedIsLeft(_ item: ViewBuilder) -> Bool {
        return item.renderedView == "0"
    }

    let renderedView: RenderedView

    init(viewRenderable: ViewRenderable) throws {
        self.renderedView = try viewRenderable.render()
    }

    public func render() throws -> RenderedView { return renderedView }
}


extension ViewRenderable {

    func createLeafFile() {
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(documentDirectory)
            let fileURL = documentDirectory.appendingPathComponent("Resources/View/\(Self.self).leaf")
            try render().write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
    }
}
