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
    @State private var startPressed = false
    
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
                if (timerManager.secondsRemaining == 0) {
                    Text("Done!").font(.title).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                } else {
                    Text("\(timerManager.secondsRemaining) s").font(.title).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                }
                
            }
            Button(action: {
                if (!timerManager.startedAtAll){
                    timerManager.start()
                }
                timerManager.working = !timerManager.working
                startPressed = !startPressed
            }) {
                if startPressed {
                    Text("Pause")
                }else {
                    Text("Start")
                }
                
            }
            .padding()
            .background(TomatoAIApp.BACKGROUND_COLOR)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
        }
    }
}
