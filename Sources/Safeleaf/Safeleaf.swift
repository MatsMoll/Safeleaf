
struct TestData {
    let name: String
    let age: Int
}


class Test {
    func test() {

        let variable = TestData(name: "Mats", age: 20)

        try! ViewNode
            .html(nodes: [

                .head(nodes: [
                    .title("Kognita"),
                    .stylesheet(href: "/styles/app.css")
                    ]),

                .body(nodes: [

                    .h1(.class("text-dark"),
                        value: variable.name),

                    .span(.class("mt-0"),
                          node: .p(
                            value: "Han er \(variable.age) år"
                        )
                    ),
                    .logic {
                        if variable.age < 20 {
                            return .p(value: "I am a kid")
                        } else {
                            return .p(value: "I am a man")
                        }
                    }
                    ])
                ]).render()

    }
}
