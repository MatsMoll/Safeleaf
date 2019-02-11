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


/// A class used to represent a placeholder view
/// This conforms to `ReflectionDecodable` and can therefore be referenced using a key-path
///
///     struct BaseView: LeafTemplate {
///
///         var body: ViewBuilder!
///
///         static func buildLeaf() throws -> ViewRenderable {
///             return body(children: get(\.body))
///         }
///     }
final public class LeafViewBuilder: LeafViewRenderable, ReflectionDecodable, Codable, Equatable {

    public static func == (lhs: LeafViewBuilder, rhs: LeafViewBuilder) -> Bool {
        return lhs.renderedView == rhs.renderedView
    }

    public static let empty = try! LeafViewBuilder(viewRenderable: "0")
    public static let one = try! LeafViewBuilder(viewRenderable: "1")

    public static func reflectDecoded() -> (LeafViewBuilder, LeafViewBuilder) {
        return try! (LeafViewBuilder(viewRenderable: "0"), LeafViewBuilder(viewRenderable: "1"))
    }

    public static func reflectDecodedIsLeft(_ item: LeafViewBuilder) -> Bool {
        return item.renderedView == "0"
    }

    private let renderedView: RenderedView

    init(viewRenderable: LeafViewRenderable) throws {
        self.renderedView = try viewRenderable.render()
    }

    public func render() throws -> RenderedView { return renderedView }
}


extension LeafViewRenderable {

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


extension LeafBuildable {
    static func registerView(in dir: URL) throws {
        try Self.buildLeaf().createLeafFile(on: dir.appendingPathComponent("\(Self.self).leaf"))
    }
}

extension LeafViewRenderable {
    func createLeafFile(on url: URL) {
        do {
            let utf8Content = try render().utf8
            let data = Data(utf8Content)
            try data.write(to: url, options: .atomic)
        } catch {
            print("Error: ", error)
        }
    }
}
