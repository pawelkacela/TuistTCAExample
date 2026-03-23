import ProjectDescription

let project = Project(
    name: "SteamWrapped",
    targets: [
        .target(
            name: "SteamWrapped",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.steamwrapped",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ]
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .project(target: "Onboarding", path: "../Features/Onboarding")
            ]
        )
    ]
)
