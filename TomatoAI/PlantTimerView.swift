//
//  PlantTimerView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct PlantTimerView: View {
    @StateObject private var viewModel = PlantTimerViewModel()
    private var plantTimerTemp: PlantTimer
    
    init(_ plantTimer: PlantTimer) {
        self.plantTimerTemp = plantTimer
    }
    
    var body: some View {
        
            VStack {
                Text("TomatoAI")
                    .font(.title)
                    .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                Text("Watering Time")
                    .font(.title)
                    .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                
                CircularProgressView(viewModel.plantTimer.seconds)
                    .frame(width: 200, height: 200)
                    .padding()
            }
            .padding()
            .scaledToFill()
            .navigationBarTitle(Text(viewModel.plantTimer.name)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
            .onAppear(perform: {
                //scunged
                viewModel.plantTimer = plantTimerTemp
            })
        
    }
    
}

extension PlantTimerView {
    @MainActor class PlantTimerViewModel: ObservableObject {
        @Published var plantTimer: PlantTimer = PlantTimer("Tomatoes", "tomato", 1, 5)
    }
}

struct PlantTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)
    }
}
