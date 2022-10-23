//
//  PlantSection.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import Foundation
import SwiftUI

class PlantTimer : Hashable, Equatable {
    func hash(into hasher: inout Hasher) { return hasher.combine(ObjectIdentifier(self))}
    static func == (lhs: PlantTimer, rhs: PlantTimer) -> Bool {
        return lhs.id == rhs.id // yuck
    }
    
    
    let id = UUID()
    var name: String
    var icon: String
    var number: Int
    @State var seconds: Int
    var height = 10.0
    var shade = 0
    var type = PlantType.none
    var sandy = false
    var loamy = false
    var clayey = false
    init(_ name:String, _ icon:String, _ number: Int, _ seconds: Int) {
        self.name = name
        self.icon = icon
        self.number = number
        self.seconds = seconds
        //updateSeconds()
    }
    func updateSeconds() {
        print("Updating Seconds")
        if let url = URL(string: "https://www.hackingwithswift.com") {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
                self.seconds = 5 // should be contents, parsed
            } catch {
                print("Could not load")
            }
        } else {
            print("Bad URL")
        }
    }
}
