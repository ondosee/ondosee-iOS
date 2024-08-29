import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
}

public extension Package {
}
