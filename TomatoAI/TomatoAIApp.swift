//
//  TomatoAIApp.swift
//  TomatoAI
//
//  Created by Ulysses Foote-McNabb on 10/22/22.
//

import SwiftUI

@main
struct TomatoAIApp: App {
    // https://www.colourlovers.com/palette/171764/bamboo_garden
    static let FOREGROUND_COLOR = Color(red: 71/255, green: 61/255, blue: 46/255)
    static let BACKGROUND_COLOR = Color(red: 238/255, green: 236/255, blue: 187/255)
    static let ALT_BACKGROUND_COLOR = Color(red: 181/255, green: 201/255, blue: 118/255)
    static let GRAY_COLOR = Color(red: 236/255, green: 240/255, blue: 241/255)
    static let GARDEN_PREVIEW = GardenArea("Garden Area", "", 1.0)
    static let PLANTTIMER_PREVIEW = PlantTimer("Plant Timer", "", 1, 10)
    var body: some Scene {
        WindowGroup {
            GardenAreas()
        }
    }
}
