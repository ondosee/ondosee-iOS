import Foundation
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let destinations: Destinations
    public let deploymentTargets: DeploymentTargets
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "ondosee",
    organizationName: "com",
    destinations: [.iPhone, .appleWatch],
    deploymentTargets: .multiplatform(iOS: "16.0", watchOS: "9.0"),
    baseSetting: [:]
)
