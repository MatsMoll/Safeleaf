# Safeleaf

Render beautiful HTML templates with a **typesafe** and clean api in pure Swift


```swift
ViewNode
    .html(nodes: [
        .head(nodes: [
            .title("This is a title")
            
            .stylesheet(href: "Some stylesheet link"),
            .stylesheet(href: "More stylesheet link"),
            
            .meta( .name("viewport"), .content("width=device-width, initial-scale=1.0"))
        ]),
        .body(nodes: [
            
            .h1(.id("big-title"), .class("text-dark margin-top-3"),
                node:
            
                .logic {
                    if isTrue {
                        return .h1(.id("title-text"), .class("text-dark margin-top-3"),
                                    content: "BIG TITLE")
                    } else {
                        return .p(.class("gray-text"),
                                    content: "Less attention")
                    }
                }),
                
                .forEach(["An","Array","Of", "Strings"]) { index, element in
                    .p(content: element)
                }
            ]),

        .script(src: "Some script link"),
        .script(src: "More scripts")
    ])
```

Swift Package Manager:
```swift
.package(url: "https://github.com/MatsMoll/Safeleaf.git", .branch("master")),
```
