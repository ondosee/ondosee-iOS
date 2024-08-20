import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

public enum ModularTarget {
    case interface
    case testing
    case unitTest
    case uiTest
    case example
}

public extension Project {
    static func makeModule(
        name: String,
        destinations: Destinations = env.destinations,
        product: Product,
        targets: Set<ModularTarget>,
        packages: [Package] = [],
        externalDependencies: [TargetDependency] = [],
        internalDependencies: [TargetDependency] = [],
        interfaceDependencies: [TargetDependency] = [],
        testingDependencies: [TargetDependency] = [],
        unitTestDependencies: [TargetDependency] = [],
        uiTestDependencies: [TargetDependency] = [],
        exampleDependencies: [TargetDependency] = [],
        sources: SourceFilesList = .sources,
        resources: ResourceFileElements? = nil,
        settings: SettingsDictionary = [:],
        additionalPlistRows: [String: ProjectDescription.Plist.Value] = [:],
        additionalFiles: [FileElement] = [],
        configurations: [Configuration] = []
    ) -> Project {
        let scripts: [TargetScript] = generateEnvironment.scripts
        let ldFlagsSettings: SettingsDictionary = product == .framework ?
        ["OTHER_LDFLAGS": .string("$(inherited) --all_load")] :
        ["OTHER_LDFLAGS": .string("$(inherited")]

        var configurations = configurations
        if configurations.isEmpty {
            configurations = [
                .debug(name: .dev, xcconfig: .shared),
                .debug(name: .stage, xcconfig: .shared),
                .release(name: .prod, xcconfig: .shared)
            ]
        }

        let settings: Settings = .settings(
            base: env.baseSetting
                .merging(settings),
            configurations: configurations,
            defaultSettings: .recommended
        )
        var allTargets: [Target] = []
        var dependencies = internalDependencies + externalDependencies

        // MARK: Interface
        if targets.contains(.interface) {
            dependencies.append(.target(name: "\(name)Interface"))
            allTargets.append(
                Target.target(
                    name: "\(name)Interface",
                    destinations: destinations,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Interface",
                    deploymentTargets: env.deploymentTargets,
                    infoPlist: .default,
                    sources: .interface,
                    scripts: scripts,
                    dependencies: internalDependencies,
                    additionalFiles: additionalFiles
                )
            )
        }

        // MARK: Sources
        allTargets.append(
            Target.target(
                name: name,
                destinations: destinations,
                product: product,
                bundleId: "\(env.organizationName).\(name)",
                deploymentTargets: env.deploymentTargets,
                infoPlist: .extendingDefault(with: additionalPlistRows),
                sources: sources,
                resources: resources,
                scripts: scripts,
                dependencies: dependencies
            )
        )

        // MARK: Testing
        if targets.contains(.testing) && targets.contains(.interface) {
            allTargets.append(
                Target.target(
                    name: name,
                    destinations: destinations,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Testing",
                    deploymentTargets: env.deploymentTargets,
                    infoPlist: .default,
                    sources: .testing,
                    scripts: scripts,
                    dependencies: [
                        .target(name: "\(name)Interface")
                    ] + testingDependencies
                )
            )
        }

        var testTargetDependencies = [
            targets.contains(.example) ?
                TargetDependency.target(name: "\(name)ExampleApp") :
                TargetDependency.target(name: name)
        ]
        if targets.contains(.testing) {
            testTargetDependencies.append(.target(name: "\(name)Testing"))
        }

        // MARK: UI Test
        if targets.contains(.uiTest) {
            allTargets.append(
                Target.target(
                    name: "\(name)UITests",
                    destinations: destinations,
                    product: .uiTests,
                    bundleId: "\(env.organizationName).\(name)UITests",
                    deploymentTargets: env.deploymentTargets,
                    infoPlist: .default,
                    scripts: scripts,
                    dependencies: testTargetDependencies + uiTestDependencies
                )
            )
        }

        // MARK: Example App
        if targets.contains(.example) {
            var exampleDependencies = exampleDependencies
            exampleDependencies.append(.target(name: name))
            if targets.contains(.testing) {
                exampleDependencies.append(.target(name: "\(name)Testing"))
            }
            allTargets.append(
                Target.target(
                    name: "\(name)ExampleApp",
                    destinations: destinations,
                    product: .app,
                    bundleId: "\(env.organizationName).\(name)ExampleApp",
                    deploymentTargets: env.deploymentTargets,
                    infoPlist: .extendingDefault(with: [
                        "UIMainStoryboardFile": "",
                        "UILaunchStoryboardName": "LaunchScreen",
                        "ENABLE_TESTS": .boolean(true),
                    ]),
                    sources: .exampleSource,
                    resources: ["Example/Resources/**"],
                    scripts: scripts,
                    dependencies: exampleDependencies
                )
            )
        }

        let schemes: [Scheme] = targets.contains(.example) ?
        [.makeScheme(target: .dev, name: name), .makeExampleScheme(target: .dev, name: name)] :
        [.makeScheme(target: .dev, name: name)]
    
        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: allTargets,
            schemes: schemes
        )
    }
}