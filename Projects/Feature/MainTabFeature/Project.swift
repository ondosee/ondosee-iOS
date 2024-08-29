import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MainTabFeature.rawValue,
    targets: [
        .implements(module: .feature(.MainTabFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .MainFeature),
            .feature(target: .WeeklyForecastFeature)
        ]),
        .tests(module: .feature(.MainTabFeature), dependencies: [])
    ]
)
