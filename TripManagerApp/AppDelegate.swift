//
//  AppDelegate.swift
//  TripManagerApp
//
//  Created by Mehtab on 19/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import KWDrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var menuDict:Dictionary<String, String>?
    var navController: UINavigationController?
    var drawerController:DrawerController?
    
    
    static func getInstance() -> AppDelegate {
       return UIApplication.shared.delegate as! AppDelegate
    }
    
// MARK: App Events
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //let controller = MainViewController(nibName: "MainView", bundle: nil)
 
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        showLoginIfRequired()
 
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

// MARK: Show Contoller Methods
    
    func showViewControllerUsingNavigationController(viewController controller: BaseViewController) {
        
    }
    
    func showDrawerController () {
        let mainViewController   = MainViewController(nibName: "MainView", bundle: nil)
        let leftViewController   = MenuViewController(nibName: "MenuView", bundle: nil)
        drawerController         = DrawerController()
        navController            = UINavigationController(rootViewController: mainViewController)

        drawerController?.setViewController(navController, side: .none)
        drawerController?.setViewController(leftViewController, side: .left)
        
        let width = Float(UIScreen.main.bounds.width)
        drawerController?.setDrawerWidth(drawerWidth: width * Float(Constants.drawer_width_factor), side: .left)
        window?.rootViewController = drawerController

        readMenuPList()
    }
    
    func setRootViewController(viewController controller: UIViewController) {
        window?.rootViewController = controller
    }
    
    func showViewController(viewController controller: BaseViewController) {
        navController?.setViewControllers([controller], animated: true)
        drawerController?.closeSide()
    }
    
    func showLoginController() {
        let controller = LoginViewController(nibName: "LoginView", bundle: nil)
        setRootViewController(viewController: controller)
    }
    
    func showSignUpController() {
        let controller = SignUpViewController(nibName: "SignUpView", bundle: nil)
        setRootViewController(viewController: controller)
    }
    
    func showMainController() {
        let mainViewController   = MainViewController(nibName: "MainView", bundle: nil)
        showViewController(viewController: mainViewController)
    }
    
// MARK: - Side Menu Methods
    
    func showStartTripController() {
        
        if  navController?.topViewController is MainViewController  {
            self.drawerController?.closeSide()
            return
        }
        
       showMainController()

    }
    
   
    func showTripHistory() {
        
        if  navController?.topViewController is TripHistoryViewController  {
            self.drawerController?.closeSide()
            return
        }
        
        let controller = TripHistoryViewController(nibName: "TripHistoryView", bundle: nil);
        showViewController(viewController: controller)
    }
    
    func showProfileController() {
        let controller = ProfileViewController(nibName: "ProfileView", bundle: nil)
        showViewController(viewController: controller)
    }
    
    func logout() {
        
    }
    
    func navigateToMenu(menuName: String) {
        let methodName = menuDict?[menuName]
        perform(Selector(methodName!))
    }
    
// MARK: - Menu Plist Method
    
    func readMenuPList () {
        menuDict = Utils.getDictionaryFromPlist(plistName: "menu")
    }
    
    
    func showLoginIfRequired() {
        
        guard  AppConfig.sharedInstance.getToken() == nil else {
            showDrawerController()
            return;
        }
        
        showLoginController()
        
    }

}

