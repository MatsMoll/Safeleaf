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
        return ViewNodeAttribute(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
    }

    public static func id(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "id", value: value)
    }

    public static func lang(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "id", value: value)
    }

    public static func alt(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "alt", value: value)
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

    public static func charset(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "name", value: value)
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

    public static func width(_ width: Int) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "width", value: "\(width)")
    }

    public static func height(_ height: Int) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "width", value: "\(height)")
    }

    public static func `for`(_ value: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "for", value: value)
    }

    public static func checked(_ value: String = "") -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "checked", value: value)
    }

    public static func placeholder(_ text: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "placeholder", value: text)
    }

    public static func action(_ text: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "action", value: text)
    }

    public static func method(_ text: String) -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "method", value: text)
    }

    public static func `required`(_ text: String = "") -> ViewNodeAttribute {
        return ViewNodeAttribute(attribute: "method", value: text)
    }
}
