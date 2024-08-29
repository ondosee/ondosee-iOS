import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
}

public extension Package {
}
