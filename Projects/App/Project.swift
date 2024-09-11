import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let configurations: [Configuration] = .default

let settings: Settings =
    .settings(
        base: env.baseSetting,
        configurations: configurations,
        defaultSettings: .recommended
    )

let scripts: [TargetScript] = generateEnvironment.scripts

let targets: [Target] = [
    .target(
        name: env.name,
        destinations: [.iPhone, .iPad],
        product: .app,
        bundleId: "\(env.organizationName).\(env.name)",
        deploymentTargets: .iOS("16.0"),
        infoPlist: .file(path: "iOS/Support/Info.plist"),
        sources: ["iOS/Sources/**"],
        resources: ["iOS/Resources/**"],
        entitlements: "iOS/Support/ondosee.entitlements",
        scripts: scripts,
        dependencies: 
            ModulePaths.Feature.allCases.map { TargetDependency.feature(target: $0) }
        + ModulePaths.Domain.allCases.map { TargetDependency.domain(target: $0) }
        +
        [
            .core(target: .Networking)
        ],
        settings: .settings(
            base: env.baseSetting
        )
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
