//
//  AppDelegate.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 17/06/22.
//

import UIKit
import CoreData
import WatchConnectivity

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var coreDataStack: CoreDataStack = CoreDataStack()
    private var session: WCSession = .default
    
    static let shared: AppDelegate = {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unexpected app deleate type, did it changed? \(String(describing: UIApplication.shared.delegate))")
        }
        return delegate
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CoreDataRepository.current.initiateTodaysChallenge()
        
        session.delegate = self
        session.activate()
        
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

extension AppDelegate: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let message = message["message"] as? String {
            if message == kRequestChallengeModel {
                if let challengeModel = CoreDataRepository.current.getTodaysChallenge() {
                    let modelDict: [String: Any] = ["title": challengeModel.title, "desc": challengeModel.desc, "isFinished": challengeModel.isFinished]
                    replyHandler([kRequestChallengeModel: modelDict])
                }
            } else if message == kFinishTodaysChallenge {
                CoreDataRepository.current.finishTodaysChallenge {
                    replyHandler([kFinishTodaysChallenge: true])
                }
            }
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
}

