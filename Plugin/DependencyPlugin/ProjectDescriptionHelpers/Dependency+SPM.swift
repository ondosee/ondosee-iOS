import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}
