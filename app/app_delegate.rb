class AppDelegate
  
def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    breweriesMapController = BreweriesMapController.alloc.init
    breweriesListController = BreweriesListController.alloc.init

    tabBarController = UITabBarController.alloc.init
    tabBarController.viewControllers = [breweriesMapController, breweriesListController]

    
    navigationController = UINavigationController.alloc.initWithRootViewController(tabBarController)
    # @window.rootViewController = BreweriesMapController.alloc.init
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible
    true
 end
end

