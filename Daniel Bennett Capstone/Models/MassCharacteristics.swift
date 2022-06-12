//
//  MassCharacteristics.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 6/11/22.
//

import Foundation

class MassCharacteristics: ObservableObject {
    var radius: Double = 0
    var texture: Double = 0
    var perimeter: Double = 0
    var area: Double = 0
    var smoothness: Double = 0
   @Published var chance: Double = 0
}
