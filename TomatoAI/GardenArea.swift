//
//  GardenArea.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import Foundation
import SwiftUI

class GardenArea : Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) { return hasher.combine(ObjectIdentifier(self))}
    static func == (lhs: GardenArea, rhs: GardenArea) -> Bool {
        return lhs.name == rhs.name && lhs.icon == rhs.icon && lhs.waterRate == rhs.waterRate && lhs.sections == rhs.sections
    }
    
    var name: String
    var icon: String
    //Making this a state variable screws everything up for whatever reason:
    var waterRate: Double// gallons per minute
    
    //making this @State means that sections won't show up in the list
    var sections = [PlantTimer]()
    init(_ name:String, _ icon:String, _ waterRate: Double) {
        self.name = name
        self.icon = icon
        self.waterRate = waterRate
    }
    func setRate(_ waterRate: Double) {
        print("Setting flow rate: \(waterRate)")
        self.waterRate = waterRate
        print("Set \(self.waterRate)")
    }
}
