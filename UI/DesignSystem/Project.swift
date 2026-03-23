import ProjectDescription

let project = Project(
    name: "DesignSystem",
    targets: [
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.steamwrapped.designsystem",
            sources: ["Sources/**"]
        )
    ]
)
