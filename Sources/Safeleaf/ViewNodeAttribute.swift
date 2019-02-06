//
//  ViewNodeAttribute.swift
//  Safeleaf
//
//  Created by Mats Mollestad on 06/02/2019.
//

import Foundation


/// An attribute on a node
///
///     ViewNodeAttribute.class("text-dark") // <... class="text-dark"/>
public struct ViewNodeAttribute {

    /// The attribute to set
    let attribute: String

    /// The value of the attribute
    let value: String
}

/// Making `ViewNodeAttribute` renderable
extension ViewNodeAttribute: ViewRenderable {
    public func render() -> String {
        return "\(attribute)='\(value)'"
    }
}

/// Some standard attributes, made easy to use
extension ViewNodeAttribute {

    public static func `class`(_ values: String...) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "class", value: values.reduce("") { $0 + " \($1)" })
    }

    public static func id(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "id", value: value)
    }

    public static func name(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "name", value: value)
    }

    public static func content(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "content", value: value)
    }

    public static func rel(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "rel", value: value)
    }

    public static func href(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "href", value: value)
    }

    public static func src(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "src", value: value)
    }

    public static func type(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "type", value: value)
    }

    public static func charset(_ value: String.Encoding) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "name", value: value.description)
    }

    public static func dataToggle(_ toggle: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "data-target", value: target)
    }

    public static func onClick(_ functionName: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "onclick", value: functionName)
    }
}
