import ProjectDescription

let project = Project(
    name: "Onboarding",
    targets: [
        .target(
            name: "Onboarding",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.steamwrapped.onboarding",
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .project(target: "DesignSystem", path: "../../UI/DesignSystem")
            ]
        ),
        .target(
            name: "OnboardingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.steamwrapped.onboarding.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Onboarding")
            ]
        )
    ]
)
