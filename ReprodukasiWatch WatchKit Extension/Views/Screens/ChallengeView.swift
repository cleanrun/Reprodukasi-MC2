//
//  ChallengeView.swift
//  ReprodukasiWatch WatchKit Extension
//
//  Created by cleanmac-ada on 14/07/22.
//

import SwiftUI
import WatchConnectivity

struct ChallengeView: View {
    @StateObject var viewModel = ChallengeViewModel()
    
    @State var challengeState: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            if viewModel.challengeDict != nil {
                List {
                    ZStack {
                        NavigationLink(destination: ReminderView(challengeDict: viewModel.challengeDict)) {
                            ZStack {
                                HStack(alignment: .top){
                                    Image(systemName: "hourglass.circle.fill")
                                    
                                    VStack(alignment: .leading, spacing: 5){
                                        Text((viewModel.challengeDict?["title"] as? String) ?? "Judul Tantangan")
                                            .font(.system(size: 17, weight: .regular))
                                        Text((viewModel.challengeDict?["desc"] as? String) ?? "Deskripsi dari tantangan hari ini")
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                }.frame(width: 180, height: 75)
                                    .navigationBarTitle("Tantangan")
                                    .navigationBarTitleDisplayMode(.inline)
                            }
                        }.frame(width: 180, height: 75)
                    }
                    
                    if !(viewModel.challengeDict?["isFinished"] as? Bool ?? false) {
                        Button("Selesai") {
                            showAlert.toggle()
                        }
                        .listItemTint(Color.accentColor)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(width: 180, height: 44)
                        .multilineTextAlignment(.center)
                        
                    } else {
                        Button("Telah selesai") {}
                            .foregroundColor(Color.green)
                            .font(.system(size: 17, weight: .semibold))
                            .listItemTint(Color.init(red: 216/255, green: 245/255, blue: 223/255))
                            .frame(width: 180, height: 44)
                            .multilineTextAlignment(.center)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .alert("Sudahkah anda melaksanakan tantangan hari ini?", isPresented: $showAlert) {
            
            Button("Ya"){
                viewModel.finishTodaysChallenge()
            }
            
            Button("Tidak"){
                showAlert.toggle()
            }
            
        }
        .onAppear {
            if viewModel.challengeDict == nil {
                viewModel.requestTodaysChallenge()
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}

class ChallengeViewModel: NSObject, ObservableObject, WCSessionDelegate {
    private var session: WCSession = .default

    @Published var challengeDict: [String: Any]?

    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func requestTodaysChallenge() {
        DispatchQueue.main.async { [weak self] in
            self?.challengeDict = nil
        }
        session.sendMessage(["message": kRequestChallengeModel], replyHandler: { [weak self] dict in
            if let model = dict[kRequestChallengeModel] as? [String: Any] {
                DispatchQueue.main.async {
                    self?.challengeDict = model
                }
            }
        })
    }
    
    func finishTodaysChallenge() {
        session.sendMessage(["message": kFinishTodaysChallenge], replyHandler: { [weak self] dict in
            if let reply = dict[kFinishTodaysChallenge] as? Bool {
                if reply {
                    self?.requestTodaysChallenge()
                }
            }
        })
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}
