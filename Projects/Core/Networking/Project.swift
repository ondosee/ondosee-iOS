import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let name = ModulePaths.Core.Networking.rawValue

let configurations: [Configuration] = generateEnvironment == .ci ?
    .default :
    [
        .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: name)),
        .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: name)),
        .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: name))
    ]

let project = Project.module(
    name: name,
    targets: [
        .interface(
            module: .core(.Networking),
            spec: .init(
                infoPlist: .extendingDefault(
                    with: [:]
                ),
                dependencies: [],
                settings: .settings(
                    base: env.baseSetting
                        .merging(.allLoadLDFlages),
                    configurations: configurations,
                    defaultSettings: .recommended
                )
            )
        ),
        .implements(
            module: .core(.Networking),
            dependencies: [
            
            ]
        ),
        .testing(module: .core(.Networking), dependencies: [
            .core(target: .Networking, type: .interface)
        ]),
        .tests(module: .core(.Networking), dependencies: [
            .core(target: .Networking)
        ])
    ]
)
