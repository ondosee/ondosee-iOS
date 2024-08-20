import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .interface(module: .feature(.BaseFeature), dependencies: [
        
        ]),
        .implements(module: .feature(.BaseFeature), product: .framework, dependencies: [
            .feature(target: .BaseFeature, type: .interface)
        ]),
        .tests(module: .feature(.BaseFeature), dependencies: [
            .feature(target: .BaseFeature)
        ])
    ]
)