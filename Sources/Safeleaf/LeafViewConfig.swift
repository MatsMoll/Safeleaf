//
//  LeafViewConfig.swift
//  Async
//
//  Created by Mats Mollestad on 11/02/2019.
//

import Foundation
import Service

struct LeafViewConfig: Service {
    var views: [Any.Type]
    let dirConfig: DirectoryConfig

    init(container: Container) throws {
        views = []
        dirConfig = try container.make(DirectoryConfig.self)
    }

    mutating func add<T: LeafBuildable>(_ buildable: T.Type) throws {
        let viewDirs = dirConfig.workDir + "Resources/Views"
        views.append(T.self)
        let url = URL(fileURLWithPath: viewDirs)
        try T.registerView(in: url)
    }
}


struct LeafViewProvider: Provider {

    func register(_ services: inout Services) throws { }

    func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        _ = try container.make(LeafViewConfig.self)
        return .done(on: container)
    }
}
