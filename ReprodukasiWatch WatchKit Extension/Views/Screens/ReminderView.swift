//
//  ReminderView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 20/07/22.
//

import SwiftUI

struct ReminderView: View {
    @State private var isReminder : Bool = false
    private var challengeDict: [String: Any]?
    
    init(challengeDict: [String: Any]?) {
        self.challengeDict = challengeDict
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5){
                Text((challengeDict?["title"] as? String) ?? "Judul Tantangan")
                    .font(.system(size: 17, weight: .bold))
                Text((challengeDict?["desc"] as? String) ?? "Deskripsi tantangan seperti apa. Jadi bisa panjang.")
                    .font(.system(size: 17, weight: .regular))
            }
            ZStack{
               RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .opacity(0.2)
                    .frame(width: 183, height: 44)
                HStack{
                    Toggle(isOn: $isReminder, label: {
                        Text("Pengingat")
                        .font(.system(size: 17, weight: .regular))
                    })
                    .frame(width: 175, height: 42, alignment: .center)
                    
                }
            }
        }.navigationTitle("Tantangan")
    }
}
