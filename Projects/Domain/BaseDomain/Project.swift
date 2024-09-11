import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .interface(module: .domain(.BaseDomain), dependencies: [
        ]),
        .implements(
            module: .domain(.BaseDomain),
            dependencies: [
                .domain(target: .BaseDomain, type: .interface),
                .core(target: .Networking, type: .interface),
                .shared(target: .GlobalThirdPartyLibrary),
                .SPM.Alamofire
            ]
        ),
        .tests(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain)
        ])
    ]
)
