//
//  CircularProgressView.swift
//  TomatoAI
//
//  Stolen from:
//  https://sarunw.com/posts/swiftui-circular-progress-bar/
//

import SwiftUI

struct CircularProgressView: View {
    let time: Int
    
    
    
    @ObservedObject var timerManager : TimerManager
    
    init (_ time: Int) {
        self.time = time
        self.timerManager = TimerManager(time)
        self.timerManager.secondsRemaining = time
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(
                        TomatoAIApp.GRAY_COLOR,
                        lineWidth: 20
                    )
                Circle()
                    .trim(from: 0, to: timerManager.progress)
                    .stroke(
                        TomatoAIApp.ALT_BACKGROUND_COLOR,
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                // 1
                    .animation(.easeOut, value: timerManager.progress)
                Text("\(timerManager.secondsRemaining) s").font(.title).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                
            }
            Button(action: {
                timerManager.start()
            }) {
                Text("Start Timer")
            }
            .padding()
            .background(TomatoAIApp.BACKGROUND_COLOR)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
        }
    }
}
