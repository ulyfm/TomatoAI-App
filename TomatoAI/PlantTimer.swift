//
//  PlantSection.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import Foundation

struct PlantTimer : Hashable {
    var name: String
    var icon: String
    var number: Int
    init(_ name:String, _ icon:String, _ number: Int) {
        self.name = name
        self.icon = icon
        self.number = number
    }
}
