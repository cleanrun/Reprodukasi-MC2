//
//  ChallengeView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI
import Foundation

struct ChallengeView: View {
    @State var totalChallenge: Int = 2;
    @State var challengeState: Bool = false
    var body: some View {
        NavigationView{
            TabView {
                ChallengeDescButton(challengeState: $challengeState)
                
                StatistikView(totalChallenge: $totalChallenge)
            }
            .navigationBarTitle("Tantangan")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChallengeDescButton: View {
    @Binding var challengeState: Bool
    var body: some View {
        
            List {
                ZStack{
                    NavigationLink(destination: PengingatView() .navigationTitle("Tantangan") .navigationBarTitleDisplayMode(.inline)){
                        
                        ZStack{
                            HStack(alignment: .top){
                                Image(systemName: "hourglass.circle.fill")
                                
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Judul Tantangan")
                                        .font(.system(size: 17, weight: .regular))
                                    Text("Deskripsi dari tantangan hari ini")
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            }.frame(width: 180, height: 75)
                        }
                    }.frame(width: 180, height: 75)
                    
                    
                }
                
                if(!challengeState) {
                    Button("Selesai") {
                    }
                        .listItemTint(Color.accentColor)
                        .frame(width: 180, height: 44)
                        .multilineTextAlignment(.center)
                        
                } else {
                    Button("Telah selesai") {print("halo2")}
                        .listItemTint(Color.accentColor)
                        .frame(width: 180, height: 44)
                        .multilineTextAlignment(.center)
                }
            }
    }
}

//struct SelesaiButton: View {
//    var body: some View {
//        ZStack{
//            NavigationLink(destination: PengingatView()){
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 182, height: 44)
//                        .foregroundColor(.accentColor)
//                    Text("Selesai")
//                }
//            } .frame(width: 182, height: 44)
//
//
//        }
//    }
//}

struct PengingatView: View {
    @State private var isReminder : Bool = false
    var body: some View {
        
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5){
                Text("Judul Tantangan")
                    .font(.system(size: 17, weight: .bold))
                Text("Deskripsi tantangan seperti apa. Jadi bisa panjang.")
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
        }
    }
}

struct FinishedChallenge: View {
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Sudahkah anda melaksanakan tantangan hari ini?")
            
            Button("Ya"){}
                .listItemTint(Color.accentColor)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            Button("Tidak"){}
                .listItemTint(Color.accentColor)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct StatistikView: View {
    @Binding var totalChallenge: Int
    
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




struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChallengeView()
        }
    }
}

struct StatistikView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StatistikView(totalChallenge: .constant(1))
        }
    }
}

