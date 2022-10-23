//
//  GardenAreaView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct GardenAreaView: View {
    var gardenArea: GardenArea
    init(_ gardenArea: GardenArea) {
        self.gardenArea = gardenArea
    }
    var body: some View {
            VStack {
                /*
                 Image(systemName: "globe")
                 .imageScale(.large)
                 .foregroundColor(.accentColor)
                 Text("Hello, world!")*/
                HStack {
                    Label("Hose: 1.2 gal/min", systemImage: ".circle")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)) {
                        Text("Recalibrate")
                            .frame(maxWidth: .infinity)
                    }
                }
                ScrollView {
                    VStack {
                        
                        ForEach(gardenArea.sections, id:\.self) { section in
                            
                            // set button:
                            NavigationLink(destination: PlantTimerView(section)) {
                                Image(section.icon).renderingMode(.original)
                                Text(section.name)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(TomatoAIApp.BACKGROUND_COLOR)
                            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            
                        }
                        // add new plant button:
                        NavigationLink(destination: PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)) {
                            Image(systemName: "plus.circle")
                            Text("Add Plants...")
                                .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(TomatoAIApp.GRAY_COLOR)
                        .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    }
                    .scrollContentBackground(.hidden)
                    .padding(0)
                    Spacer()
                }
            }
            .padding()
        
        .navigationBarTitle(Text(gardenArea.name)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
        
    }
}

struct GardenAreaView_Previews: PreviewProvider {
    static var previews: some View {
        GardenAreaView(TomatoAIApp.GARDEN_PREVIEW)
    }
}
