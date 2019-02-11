//
//  ViewRenderer+render.swift
//  Async
//
//  Created by Mats Mollestad on 11/02/2019.
//

import Foundation
import TemplateKit

extension ViewRenderer {
    func render<T: StaticLeafView>(static view: T.Type) -> Future<View> {
        return render("\(T.self)")
    }

    func render<T: LeafTemplate>(template: T.Type, with content: T.ContentType) throws -> Future<View> {
        guard let path = try T.reflectProperty(forKey: T.contentPath) else {
            throw NSError(domain: "", code: 0)
        }
        let variableName = path.path.reduce("") { $0 + $1 + "." }.dropLast()
        return render("\(T.self)", userInfo: [String(variableName) : content])
    }
}
