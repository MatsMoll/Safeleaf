# Safeleaf

Render Leaf templating files in a **typesafe** way.
By combining the Leaf templating language, and the Swift programming language, you can catch bugs earlier in the process. 

So how does it work?

Lets create a simple static view that is only a HTML div tag with some attributes and some text inside.

```swift
final class SimpleView: StaticLeafView {

    static func buildLeaf() throws -> ViewRenderable {  // <div id='Test' class='some-class'>Hello</div>
        return
            div(attributes: [.id("Test"), .class("some-class")], children: "Hello")
    }
}

final class SimpleTemplate: LeafTemplate {

    var content: SimpleData!

    static func buildLeaf() throws -> ViewRenderable { // <div><h1>#(content.title)</h1><p>#(content.description)</p></div>
        return try
            div(children:
                h1(children: variable(\.content.title)),
                p(children: variable(\.content.description))
        )
    }
}
```

By conforming to `LeafBuildable`, `StaticLeafView` or `LeafTemplate`, you get access to the helperfunctions that make it easy to create.

Whats the differance between these three?

- `StaticLeafView` is a static view that needs no variables to render. Shown above in `SimpleView`
- `LeafTemplate` is a view that needs some content to render. Shown above in `SimpleTemplate`. Here you can se the renderd leaf has two variables.
- `SimpleTemplate` a generic class that can build a leaf file

But what about embedding files?

This is done safely by checking if the variable names match in the embedded view and the view embedding it.

```swift

final class BaseTemplate: LeafTemplate {

    static var contentPath: WritableKeyPath<BaseTemplate, SimpleData> = \.content

    var content: SimpleData!
    var views: BaseTemplateView!


    static func buildLeaf() throws -> ViewRenderable { 
    
        // <html><head><title>#(content.title)</title><meta name='description' content='#(content.description)'/>#get(views.extraHeader)</head><body>#get(views.content)</body></html>
    
        return try  
            html(children:
                head(children:
                    title(children: variable(\.content.title)),
                    meta(attributes: .name("description"), .content(variable(\.content.description))),
                    get(\.views.extraHeader)
                ),
                body(children:
                    get(\.views.content)
                )
            )
    }
}

final class UsingBaseTemplate: LeafBuildable {

    let content: SimpleData     // Checked if this variable name is the same as BaseTemplate.content

    static func buildLeaf() throws -> ViewRenderable {
    
        // #set("views.extraHeader") {<link href='some-url'/>}#set("views.content") {<h1>Some title</h1>}#embed(BaseTemplate)
    
        return try [
            set(for: \BaseTemplate.views.extraHeader) {
                link(href: "some-url")
            },
            set(for: \BaseTemplate.views.content) {
                h1(children: "Some title")
            },
            embed(template: BaseTemplate.self)
        ]
    }
}
```


## Swift Package Manager:

To add this framework, add the package manager below

```swift
.package(url: "https://github.com/MatsMoll/Safeleaf.git", .branch("master")),
```
