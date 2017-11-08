//
//  AppDelegate.swift
//  CodableSample
//
//  Created by other on 2017/11/07.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import UIKit
import APIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if true {
            let request = RandomUserAPI()
            
            Session.send(request) { result in
                switch result {
                case .success(let userData):
                    print("userData : \(userData)")
                    print("info : \(userData.info)")
                    print("page : \(userData.info.page)")
                    print("results : \(userData.info.results)")
                    print("seed : \(userData.info.seed)")
                    print("version : \(userData.info.version)")
                    print("results : \(userData.results)")

                    for user in userData.results {
                        print("email : \(user.email)")
                        print("gender : \(user.gender)")
                        print("location : \(user.location)")
                        print("location > city: \(user.location.city)")
                        print("location > postcode: \(user.location.postcode)")
                        print("location > state: \(user.location.state)")
                        print("location > street: \(user.location.street)")
                        print("name : \(user.name)")
                        print("name > first : \(user.name.first)")
                        print("name > last : \(user.name.last)")
                        print("name > title : \(user.name.title)")
                        print("login : \(user.login)")
                        print("login > md5: \(user.login.md5)")
                        print("login > password: \(user.login.password)")
                        print("login > salt: \(user.login.salt)")
                        print("login > sha1: \(user.login.sha1)")
                        print("login > sha256: \(user.login.sha256)")
                        print("login > username: \(user.login.username)")

                        print("dob : \(user.dob)")
                        print("registered : \(user.registered)")
                        print("phone : \(user.phone)")
                        print("cell : \(user.cell)")

//                        print("id : \(user.id)")
//                        print("id > name: \(user.id.name)")
//                        print("id > value: \(user.id.value)")

                        print("picture : \(user.picture)")
                        print("picture > large: \(user.picture.large)")
                        print("picture > medium: \(user.picture.medium)")
                        print("picture > thumbnail: \(user.picture.thumbnail)")
                    }
                    
                case .failure(let error):
                    print("error: \(error)")
                }
            }
        }
        
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


}

