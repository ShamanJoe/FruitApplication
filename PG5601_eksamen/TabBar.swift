import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }
    
    func setupVCs() {
          viewControllers = [
              createNavController(for: FruityListVC(), title: NSLocalizedString("Fruit List", comment: ""), image: UIImage(named: "diet")!),
              createNavController(for: GroupingPageVC(), title: NSLocalizedString("Groups", comment: ""), image: UIImage(named: "group")!),
          ]
      }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }

}
