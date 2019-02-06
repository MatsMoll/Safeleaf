//
//  ForEach.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

class ForEach<T>: ViewRenderable {

    let objects: [T]
    let creation: (Int, T) -> ViewRenderable

    init(objects: [T], creation: @escaping ((Int, T) -> ViewRenderable)) {
        self.objects = objects
        self.creation = creation
    }

    func render() throws -> String {
        return try objects.enumerated().reduce("") { try $0 + creation($1.0, $1.1).render() }
    }


    static func inCollection<V: ViewRenderInitable>(_ collection: [V.ContentType], render type: V.Type) -> ViewRenderable {
        return ForEach<V.ContentType>(objects: collection, creation: { (_, element) in
            type.init(content: element)
        })
    }
}
