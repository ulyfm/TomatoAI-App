//
//  TimerManager.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI
import Foundation
class TimerManager : ObservableObject {
    @Published var secondsRemaining = 15
    var secondsDouble = 15.0
    @Published var progress: Double = 0.0
    var working = false
    var startedAtAll = false
    var startTime: Double
    
    init (_ time : Int) {
        secondsDouble = Double(time)
        startTime = Double(time)
    }
    var timer = Timer()
    func start() {
        startedAtAll = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if (self.secondsDouble > 0 && self.working) {
                self.secondsDouble -= 0.1
                self.secondsRemaining = Int(round(self.secondsDouble))
                self.progress = (self.startTime - self.secondsDouble) / self.startTime
            }
        }
    }
}
