//
//  ContentView.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var timerManager = TimerManager()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all).opacity(0.9)
            CircleBackgroundView()
            VStack(spacing: 0) {
                Spacer()
                TimerView(timerManager: timerManager)
                    .padding(.top, dynHeight * 0.05)
                Spacer()
                DefaultButtonView("I Joked, Restart") {
                    timerManager.resetTimer()
                    AudioPlayerManager.shared.playSound()
                }
                .padding(.bottom, dynHeight * 0.05)
            }
            .onAppear {
                timerManager.startTimer()
            }
            
        }
            
        }
}

#Preview {
    ContentView()
}
