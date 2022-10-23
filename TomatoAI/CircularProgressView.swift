//
//  CircularProgressView.swift
//  TomatoAI
//
//  Stolen from:
//  https://sarunw.com/posts/swiftui-circular-progress-bar/
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    TomatoAIApp.GRAY_COLOR,
                    lineWidth: 20
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    TomatoAIApp.ALT_BACKGROUND_COLOR,
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)

        }
    }
}
