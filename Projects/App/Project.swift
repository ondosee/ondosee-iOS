import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let configurations: [Configuration] = generateEnvironment == .ci ?
    .default :
    [
        .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: env.name)),
        .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: env.name)),
        .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: env.name))
    ]

let settings: Settings = .settings(
    base: env.baseSetting,
    configurations: configurations,
    defaultSettings: .recommended
)

let scripts: [TargetScript] = generateEnvironment.scripts

let targets: [Target] = [
    .target(
        name: env.name,
        destinations: [.iPhone],
        product: .app,
        bundleId: "\(env.organizationName).\(env.name)",
        deploymentTargets: .iOS("16.0"),
        infoPlist: .file(path: "iOS/Support/Info.plist"),
        sources: ["iOS/Sources/**"],
        resources: ["iOS/Resources/**"],
        entitlements: .file(path: "iOS/Support/ondosee.entitlements"),
        scripts: scripts,
        dependencies: ModulePaths.Feature.allCases.map { TargetDependency.feature(target: $0) } 
        + ModulePaths.Domain.allCases.map { TargetDependency.domain(target: $0) }
        + [
            .core(target: .Networking),
            .target(name: "\(env.name)Widget"),
            .target(name: "\(env.name)WatchApp"),
        ],
        settings: settings
    ),
    .target(
        name: "\(env.name)Widget",
        destinations: [.iPhone],
        product: .appExtension,
        bundleId: "\(env.organizationName).\(env.name).ondoseeWidget",
        deploymentTargets: .iOS("16.0"),
        infoPlist: .file(path: "iOS-Widget/Support/Info.plist"),
        sources: ["iOS-Widget/Sources/**"],
        resources: ["iOS-Widget/Resources/**"],
        entitlements: .file(path: "iOS-Widget/Support/ondoseeWidget.entitlements"),
        scripts: scripts,
        dependencies: [
            .userInterface(target: .DesignSystem)
        ],
        settings: settings
    ),
    .target(
        name: "\(env.name)WatchApp",
        destinations: [.appleWatch],
        product: .app,
        bundleId: "\(env.organizationName).\(env.name).watchkitapp",
        deploymentTargets: .watchOS("9.0"),
        infoPlist: .file(path: "watchOS/Support/Info.plist"),
        sources: ["watchOS/Sources/**"],
        resources: ["watchOS/Resources/**"],
        scripts: scripts,
        dependencies: [
            .userInterface(target: .DesignSystem)
        ],
        settings: settings
    )
]

let schemes: [Scheme] = [
    .scheme(
        name: "\(env.name)-DEV",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .dev),
        archiveAction: .archiveAction(configuration: .dev),
        profileAction: .profileAction(configuration: .dev),
        analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .scheme(
        name: "\(env.name)-STAGE",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .stage),
        archiveAction: .archiveAction(configuration: .stage),
        profileAction: .profileAction(configuration: .stage),
        analyzeAction: .analyzeAction(configuration: .stage)
    ),
    .scheme(
        name: "\(env.name)-PROD",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .prod),
        archiveAction: .archiveAction(configuration: .prod),
        profileAction: .profileAction(configuration: .prod),
        analyzeAction: .analyzeAction(configuration: .prod)
    )
]

let project = Project(
    name: env.name,
    organizationName: env.organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
