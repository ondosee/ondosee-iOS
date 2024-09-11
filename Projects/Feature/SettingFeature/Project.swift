import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SettingFeature.rawValue,
    targets: [
        .implements(module: .feature(.SettingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.SettingFeature), dependencies: [
            .feature(target: .SettingFeature)
        ]),
        .example(module: .feature(.SettingFeature), dependencies: [
            .feature(target: .SettingFeature)
        ])
    ]
)
