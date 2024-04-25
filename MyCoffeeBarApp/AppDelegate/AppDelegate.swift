//
//  AppDelegate.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         //Выполним чтение из UserDefaults и установку языка на фоновом потоке
                DispatchQueue.global(qos: .background).async {
                    if let savedLanguageString = UserDefaults.standard.string(forKey: "selectedLanguage"),
                       let savedLanguage = LanguageType(rawValue: savedLanguageString) {
                        AppLanguageManager.shared.setAppLanguage(language: savedLanguage)
                    } else {
                        AppLanguageManager.shared.setAppLanguage(language: .en)
                    }
        
                    // После установки языка выполним конфигурацию Firebase на главном потоке
                    DispatchQueue.main.async {
                        FirebaseApp.configure()
                    }
                }
        
//        FirebaseApp.configure()
        return true
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

