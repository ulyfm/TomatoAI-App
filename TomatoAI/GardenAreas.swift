//
//  ContentView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

struct GardenAreas: View {
    var areas = [GardenArea]()
    
    init () {
        // TEST CODE EXAMPLE
        
        var fy = GardenArea("Front Yard", "", 1.0)
        fy.sections.append(PlantTimer("Tomatoes", "tomato", 4, 10))
        fy.sections.append(PlantTimer("Potatoes", "potato", 6, 20))
        fy.sections.append(PlantTimer("Peach", "peach", 1, 25))
        //fy.sections[0].updateSeconds()
        areas.append(fy)
        areas.append(GardenArea("Back Yard", "", 2.0))
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Label("TomatoAI", systemImage: ".circle")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: PlantTimerView(TomatoAIApp.PLANTTIMER_PREVIEW)){
                        Image(systemName: "plus.circle")
                    }
                    
                }.padding()
                ScrollView {
                    VStack {
                        ForEach(areas, id:\.self) { area in
                            NavigationLink(destination: GardenAreaView(area)) {
                                Text(area.name)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(TomatoAIApp.BACKGROUND_COLOR)
                            .foregroundColor(TomatoAIApp.FOREGROUND_COLOR)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .padding(0)
                    Spacer()
                    
                }
                .padding()
                
            }
        }
        
    }
}

struct GardenAreas_Previews: PreviewProvider {
    static var previews: some View {
        var ga = GardenAreas()
        // add some sample areas
        var fy = GardenArea("Front Yard", "", 1.0)
        fy.sections.append(PlantTimer("Tomatoes", "tomato", 4, 15))
        fy.sections.append(PlantTimer("Potatoes", "potato", 6, 20))
        fy.sections.append(PlantTimer("Peach Tree", "peach", 1, 25))
        //fy.sections[0].updateSeconds()
        ga.areas.append(fy)
        ga.areas.append(GardenArea("Back Yard", "", 2.0))
        return ga
    }
}

