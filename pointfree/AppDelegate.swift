import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
            |> keyWindow()
            <> { [navigationController] in
                $0.rootViewController = navigationController
                $0.backgroundColor = .white
            }

        return true
    }

    private lazy var navigationController = UINavigationController()
        |> setController(ViewController())

}

private func keyWindow(size: CGSize = UIScreen.main.bounds.size) -> (UIWindow) -> Void {
    return { window in
        window.frame = CGRect(origin: .zero, size: size)
        window.makeKeyAndVisible()
    }
}

private func setController(_ controller: UIViewController) -> (UINavigationController) -> Void {
    return [controller]
        |> setControllers(animated: true)
}

private func setControllers(animated: Bool) -> ([UIViewController]) -> (UINavigationController) -> Void {
    return animated
        |> flip(curry(flip(UINavigationController.setViewControllers)))
}
