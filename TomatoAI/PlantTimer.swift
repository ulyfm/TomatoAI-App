//
//  PlantSection.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import Foundation

struct PlantTimer : Hashable {
    let id = UUID()
    var name: String
    var icon: String
    var number: Int
    var seconds: Int
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
        let url = URL(string: "https://google.com")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
