//
//  PlantTimerView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct PlantTimerView: View {
    @State var progress: Double = 0.6
    var plantTimer: PlantTimer
    init(_ plantTimer: PlantTimer) {
        self.plantTimer = plantTimer
    }
    var body: some View {
        
            VStack {
                CircularProgressView(progress: progress)
                    .frame(width: 200, height: 200)
                  
            }
            .padding()
            
            .navigationBarTitle(Text(plantTimer.name)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
    }
}

struct PlantTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)
    }
}
