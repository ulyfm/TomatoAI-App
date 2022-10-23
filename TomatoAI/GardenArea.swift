//
//  GardenArea.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import Foundation

struct GardenArea : Hashable {
    var name: String
    var icon: String
    var waterRate: Double // gallons per minute
    var sections = [PlantTimer]()
    init(_ name:String, _ icon:String, _ waterRate: Double) {
        self.name = name
        self.icon = icon
        self.waterRate = waterRate
    }
}
