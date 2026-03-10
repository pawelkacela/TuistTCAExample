import ProjectDescription

let project = Project(
    name: "TuistTCAExample",
    targets: [
        .target(
            name: "TuistTCAExample",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistTCAExample",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["TuistTCAExample/Sources/**"],
            resources: ["TuistTCAExample/Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "TuistTCAExampleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistTCAExampleTests",
            infoPlist: .default,
            sources: ["TuistTCAExample/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistTCAExample")]
        ),
    ]
)
