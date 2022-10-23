//
//  CalibrationView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct CalibrationView: View {
    
    var gardenArea: GardenArea
    init (_ gardenArea: GardenArea) {
        self.gardenArea = gardenArea
    }
    
    var body: some View {
        
        
        VStack {
            Text("To recalibrate your hose flow rate, find a bucket or container with a known volume. Enter the volume (in gallons) below:").font(.title2).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            TextField("Bucket Volume", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).font(.title2)
            Text("The next step is to measure the time it takes to fill the bucket with your hose. Press start when you begin filling your bucket, then press stop when it is full.").font(.title2).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            Button(action: {
                
                
            }) {
                Text("Start Timer")
            }
            .padding()
            .background(TomatoAIApp.BACKGROUND_COLOR)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            Spacer()
            
        }
        .padding()
        .navigationBarTitle(Text("Recalibrate Hose")
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
    
    }
}

struct CalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        CalibrationView(TomatoAIApp.GARDEN_PREVIEW)
    }
}
