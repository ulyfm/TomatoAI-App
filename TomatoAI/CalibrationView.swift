//
//  CalibrationView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct CalibrationView: View {
    
    var gardenArea: GardenArea
    @Environment(\.presentationMode) var presentation
    @State private var toggleButton = false
    @State private var timeMeasured = false
    @State private var startTime: Double = 0.0
    @State private var timeElapsed: Double = 0.0
    @State private var flowRate: Double = 0.0
    @State private var textInput: String = ""
    
    init (_ gardenArea: GardenArea) {
        self.gardenArea = gardenArea
    }
    
    
    var body: some View {
        
        
        VStack {
            Text("To recalibrate your hose flow rate, find a bucket or container with a known volume. Enter the volume (in gallons) below:").font(.title2).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            TextField("Bucket Volume", text: $textInput).font(.title2)
            Text("The next step is to measure the time it takes to fill the bucket with your hose. Press start when you begin filling your bucket, then press stop when it is full.").font(.title2).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            Button(action: {
                if toggleButton {
                    timeMeasured = true
                    timeElapsed = NSDate().timeIntervalSince1970 - startTime
                    flowRate = (textInput as NSString).doubleValue / (timeElapsed/60) // TODO fix this
                } else {
                    timeMeasured = false
                    startTime = NSDate().timeIntervalSince1970
                }
                toggleButton = !toggleButton
                
            }) {
                if !toggleButton {
                    Text("Start Timer")
                } else {
                    Text("End Timer")
                }
                
            }
            .padding()
            .background(TomatoAIApp.BACKGROUND_COLOR)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            if timeMeasured {
                Text("It took you \(timeElapsed) seconds to fill the bucket. Your hose's estimated flow rate is \(flowRate) gallons per minute.").font(.title2).foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                
                Button(action: {
                    self.gardenArea.setFlowRate(flowRate)
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Confirm")
                }
                .padding()
                .background(TomatoAIApp.BACKGROUND_COLOR)
                .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            }
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
