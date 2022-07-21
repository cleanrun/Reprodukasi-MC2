//
//  StatisticsView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI

struct StatisticsView: View {
    var totalChallenge: Int = 1
    
    func getTotalDay() -> Int {
        let dateComponents = DateComponents(year: 2015, month: 7)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        return numDays
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(header:
                Text("Progres Tantangan")
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .textCase(nil)
            ) {
                Divider()
                HStack(alignment: .top, spacing: 8) {
                    Image("kalender-minggu")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.gray)
                    VStack(alignment: .leading) {
                        Text("Minggu Ini")
                        Text("\(totalChallenge) / 7 terselesaikan")
                            .font(.footnote)
                            .foregroundColor(Color.accentColor)
                    }
                }
                Divider()
                HStack(alignment: .top, spacing: 8) {
                    Image("kalender-bulan")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.gray)
                    VStack(alignment: .leading) {
                        Text("Bulan Ini")
                        Text("\(totalChallenge) / \(getTotalDay()) terselesaikan")
                            .font(.footnote)
                            .foregroundColor(Color.accentColor)
                    }
                }
            }
            Spacer()
           
        }
        .navigationBarTitle("Statistik")
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
