import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.WeeklyForecastFeature.rawValue,
    targets: [
        .implements(module: .feature(.WeeklyForecastFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.WeeklyForecastFeature), dependencies: [
            .feature(target: .WeeklyForecastFeature)
        ]),
        .example(module: .feature(.WeeklyForecastFeature), dependencies: [
            .feature(target: .WeeklyForecastFeature)
        ])
    ]
)
