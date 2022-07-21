//
//  FinishedChallengeView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI

struct FinishedChallengeView: View {
    var body: some View {
        VStack {
            Text("Kereen!")
                .font(.system(size: 17, weight: .bold))
                .frame(alignment: .center)
            
            Image(systemName: "hourglass.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Button("Tutup"){
            }
            
        }
    }
}

struct FinishedChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedChallengeView()
    }
}
