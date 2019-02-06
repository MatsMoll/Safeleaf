//
//  IF.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation

struct Condition {
    let condition: Bool
    let render: () -> ViewRenderable
}


class IF: ViewRenderable {

    private var conditions: [Condition]

    init(_ condition: Bool, render: @escaping () -> ViewRenderable) {
        conditions = [
            Condition(condition: condition, render: render)
        ]
    }

    func `else`(if condition: Bool = true, render: @escaping () -> ViewRenderable) -> IF {
        conditions.append(
            Condition(condition: condition, render: render)
        )
        return self
    }

    func render() throws -> RenderedView {
        for condition in conditions {
            if condition.condition {
                return try condition.render()
                    .render()
            }
        }
        return ""
    }
}
