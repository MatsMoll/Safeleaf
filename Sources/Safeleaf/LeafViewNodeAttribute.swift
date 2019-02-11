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
public struct LeafViewNodeAttribute {

    /// The attribute to set
    let attribute: String

    /// The value of the attribute
    let value: String
}

/// Making `ViewNodeAttribute` renderable
extension LeafViewNodeAttribute: LeafViewRenderable {
    public func render() -> String {
        return "\(attribute)='\(value)'"
    }
}

/// Some standard attributes, made easy to use
extension LeafViewNodeAttribute {

    public static func `class`(_ values: String...) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
    }

    public static func id(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "id", value: value)
    }

    public static func lang(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "id", value: value)
    }

    public static func alt(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "alt", value: value)
    }

    public static func name(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "name", value: value)
    }

    public static func content(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "content", value: value)
    }

    public static func rel(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "rel", value: value)
    }

    public static func href(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "href", value: value)
    }

    public static func src(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "src", value: value)
    }

    public static func type(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "type", value: value)
    }

    public static func charset(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "name", value: value)
    }

    public static func dataToggle(_ toggle: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "data-target", value: target)
    }

    public static func onClick(_ functionName: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "onclick", value: functionName)
    }

    public static func width(_ width: Int) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "width", value: "\(width)")
    }

    public static func height(_ height: Int) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "width", value: "\(height)")
    }

    public static func `for`(_ value: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "for", value: value)
    }

    public static func checked(_ value: String = "") -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "checked", value: value)
    }

    public static func placeholder(_ text: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "placeholder", value: text)
    }

    public static func action(_ text: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "action", value: text)
    }

    public static func method(_ text: String) -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "method", value: text)
    }

    public static func `required`(_ text: String = "") -> LeafViewNodeAttribute {
        return LeafViewNodeAttribute(attribute: "method", value: text)
    }
}
