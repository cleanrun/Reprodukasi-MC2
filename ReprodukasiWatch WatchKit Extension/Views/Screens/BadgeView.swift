//
//  BadgeView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        
        VStack(spacing: 5) {
            Image("Sangat Menantang")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Selamat!")
                .font(.system(size: 17, weight: .semibold))
                .frame(alignment: .center)
            Text("Kamu mendapatkan badges. Detail bisa dicek di aplikasi!")
                .font(.system(size: 17, weight: .regular))
                .multilineTextAlignment(.center)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
