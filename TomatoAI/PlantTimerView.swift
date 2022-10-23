//
//  PlantTimerView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct PlantTimerView: View {
    var plantTimer: PlantTimer
    

    
    init(_ plantTimer: PlantTimer) {
        self.plantTimer = plantTimer
    }
    var body: some View {
        
            VStack {
                Text("TomatoAI")
                    .font(.title)
                    .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                Text("Watering Time")
                    .font(.title)
                    .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                
                CircularProgressView(plantTimer.seconds)
                    .frame(width: 200, height: 200)
                    .padding()
            }
            .padding()
            .scaledToFill()
            .navigationBarTitle(Text(plantTimer.name)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
        
    }
    
}

struct PlantTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)
    }
}
