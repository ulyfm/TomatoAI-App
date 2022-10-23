//
//  PlantAddEditView.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/23/22.
//

import SwiftUI

struct PlantAddEditView: View {
    @State var plant: PlantTimer
    @State var gardenArea: GardenArea
    @State var editing: Bool
    @State private var plantName: String = ""
    @State private var plantSelection: PlantType = PlantType.none
    @State private var plantCount: Int = 1
    @State private var plantHeight: Double = 36.0
    @State private var sandySoil: Bool = false
    @State private var loamySoil: Bool = false
    @State private var clayeySoil: Bool = false
    @State private var shady: Bool = false
    @State private var middle: Bool = false
    @State private var sunny: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter Plant/Garden Area Name...", text: $plantName)
                Picker("Plant Type", selection: $plantSelection) {
                    ForEach(PlantType.allCases, id: \.self) { item in
                        Text(item.rawValue)
                        
                    }
                }
                Stepper("Number of Plant: \(plantCount)", value: $plantCount, in:1...100)
                VStack {
                    Text("Plant Height (inches): \(plantHeight, specifier: "%.1f")")
                    Slider(value: $plantHeight, in: 0...72)
                }
                HStack {
                    Text("Soil:")
                    Toggle(isOn: $sandySoil) {
                            Text("Sandy")
                    }.toggleStyle(.button)
                    Toggle(isOn: $loamySoil) {
                            Text("Loamy")
                    }.toggleStyle(.button)
                    Toggle(isOn: $clayeySoil) {
                            Text("Clayey")
                    }.toggleStyle(.button)
                }
                HStack {
                    Text("Shade:")
                    Toggle(isOn: $shady) {
                            Text("Shady")
                    }.toggleStyle(.button)
                    Toggle(isOn: $middle) {
                            Text("Mid")
                    }.toggleStyle(.button)
                    Toggle(isOn: $sunny) {
                            Text("Sunny")
                    }.toggleStyle(.button)
                }
            }
            Spacer()
        }.navigationBarTitle("Add/Edit Plant")//todo problem?
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                    Text("Cancel")
                },
                trailing:
                Button(action : {
                    if !editing {
                        plant = PlantTimer("", "", 1, 10)
                        
                    }
                    //save plant details
                    plant.name = self.plantName
                    plant.number = self.plantCount
                    plant.loamy = self.loamySoil
                    plant.clayey = self.clayeySoil
                    plant.sandy = self.sandySoil
                    plant.type = self.plantSelection
                    plant.height = self.plantHeight
                    if shady {
                        plant.shade = 0
                    } else if sunny {
                        plant.shade = 2
                    } else if middle {
                        plant.shade = 1
                    }
                    plant.icon = self.plantSelection.rawValue.lowercased()
                    if !editing {
                        gardenArea.sections.append(plant)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Save")
            })
    }
}

struct PlantAddEditView_Previews: PreviewProvider {
    static var previews: some View {
        PlantAddEditView(plant: PlantTimer("Tomato", "tomato", 2, 10), gardenArea: GardenArea("A", "B", 0.5), editing: false)
    }
}

enum PlantType: String, CaseIterable {
    
    case none, Tomato, Potato, Peach
    
    var intValue: Int {
        switch self {
        case .none: return 0
        case .Tomato: return 1
        case .Potato: return 2
        case .Peach: return 3
        }
    }
    
}
