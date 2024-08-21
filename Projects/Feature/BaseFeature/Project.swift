import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .implements(
            module: .feature(.BaseFeature),
            product: .framework,
            dependencies: [
                .userInterface(target: .DesignSystem)
            ]
        )
    ]
)
