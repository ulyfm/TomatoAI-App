//
//  GardenAreaView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI
import Foundation

struct GardenAreaView: View {
    @StateObject private var viewModel = GardenAreaViewModel()
    private var gardenAreaTemp: GardenArea
    
    init(_ gardenArea: GardenArea) {
        self.gardenAreaTemp = gardenArea
    }
    

    var body: some View {
            VStack {
                HStack {
                    Label("Hose: \(String(format: "%.2f", viewModel.gardenArea.waterRate)) gal/min", systemImage: ".circle")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: CalibrationView(gardenArea: viewModel.gardenArea)) {
                        Text("Recalibrate")
                            .frame(maxWidth: .infinity)
                    }
                }
                ScrollView {
                    VStack {
                        
                        ForEach(viewModel.gardenArea.sections, id:\.id) { section in
                            let _ = section.updateSeconds()
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
                        NavigationLink(destination: PlantAddEditView(plant: PlantTimer("", "", 1, 10), gardenArea: viewModel.gardenArea, editing:false)) {
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
            .onAppear(perform: {
                //scunged
                viewModel.gardenArea = gardenAreaTemp
            })
        
            //.onAppear(perform: update)
            
        
            .navigationBarTitle(Text(viewModel.gardenArea.name)
            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR).font(.title2), displayMode: .inline)
        
        
    }
}

extension GardenAreaView {
    @MainActor class GardenAreaViewModel: ObservableObject {
        @Published var gardenArea: GardenArea = GardenArea("", "", 1.0)
    }
}

/*

struct GardenAreaView_Previews: PreviewProvider {
    static var previews: some View {
        GardenAreaView(TomatoAIApp.GARDEN_PREVIEW)
    }
}
*/
