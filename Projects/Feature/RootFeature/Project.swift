import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .MainTabFeature)
        ]),
        .tests(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
