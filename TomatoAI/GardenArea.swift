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
    var waterRate: Float // gallons per minute
    var sections = [PlantTimer]()
    init(_ name:String, _ icon:String, _ waterRate: Float) {
        self.name = name
        self.icon = icon
        self.waterRate = waterRate
    }
}
