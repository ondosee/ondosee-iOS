import Foundation
import ProjectDescription

public extension TargetDependency {
    static func feature(
        target: ModulePaths.Feature,
        type: ModularTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToFeature(target.rawValue)
        )
    }

    static func domain(
        target: ModulePaths.Domain,
        type: ModularTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToDomain(target.rawValue)
        )
    }
    
    static func core(
        target: ModulePaths.Core,
        type: ModularTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToCore(target.rawValue)
        )
    }
    
    static func shared(
        target: ModulePaths.Shared,
        type: ModularTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToShared(target.rawValue)
        )
    }
    
    static func userInterface(
        target: ModulePaths.UserInterface,
        type: ModularTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToUserInterface(target.rawValue)
        )
    }
}
