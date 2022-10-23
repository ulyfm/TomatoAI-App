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
    @State var waterRate: Double// gallons per minute
    
    var sections = [PlantTimer]()
    init(_ name:String, _ icon:String, _ waterRate: Double) {
        self.name = name
        self.icon = icon
        self.waterRate = waterRate
    }
}
