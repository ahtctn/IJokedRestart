//
//  TimerView.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//


import SwiftUI

struct TimerView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea(.all)
            VStack {
                Text("I haven't made\n any jokes since:")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(FontHandler.makeFont(.sansSemiBold28))
                HStack(spacing: 10) {
                    TimeUnitView(timeUnit: Int(timerManager.elapsedTime) / (60 * 60 * 24 * 7), unit: "W")
                    Text(":")
                        .foregroundStyle(.white)
                        .font(FontHandler.makeFont(.sansBold20))
                    TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24)) % 7, unit: "D")
                    Text(":")
                        .foregroundStyle(.white)
                        .font(FontHandler.makeFont(.sansBold20))
                    TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 3600) % 24, unit: "H")
                    
                }
                HStack(spacing: 10) {
                    TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 60) % 60, unit: "M")
                    Text(":")
                        .foregroundStyle(.white)
                        .font(FontHandler.makeFont(.sansBold20))
                    TimeUnitView(timeUnit: Int(timerManager.elapsedTime) % 60, unit: "S")
                    Text(":")
                        .foregroundStyle(.white)
                        .font(FontHandler.makeFont(.sansBold20))
                    TimeUnitView(timeUnit: Int(timerManager.elapsedTime.truncatingRemainder(dividingBy: 1) * 100), unit: "MS")
                }
            }
        }
        .frame(height: dynHeight * 0.5)
    }
}

struct TimeUnitView: View {
    let timeUnit: Int
    let unit: String
    
    private var rectangleLinearColor: LinearGradient {
        LinearGradient(stops: [.init(color: Color.blue.opacity(1),
                                     location: 0.6),
                               .init(color: Color.mint.opacity(1),
                                     location: 1)],
                       startPoint: .bottomLeading,
                       endPoint: .topTrailing)
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.mint]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                )
                .overlay(
                    Text(String(format: "%02d", timeUnit))
                        .font(FontHandler.makeFont(.sansBold24))
                        .foregroundColor(.white)
                )
                .cornerRadius(10)
            Text(unit)
                .font(FontHandler.makeFont(.sansBold12))
                .foregroundColor(.white)
                .padding(.all, dynWidth * 0.026666666667)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.mint]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ))
                        .opacity(0.3)
                )
        }
    }
}
