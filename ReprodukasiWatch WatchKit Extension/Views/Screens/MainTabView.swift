//
//  ContentView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ChallengeView()
            }
            StatisticsView()
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
