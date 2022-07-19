//
//  ReprodukasiApp.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI

@main
struct ReprodukasiApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            
            MainTabView()
            
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
