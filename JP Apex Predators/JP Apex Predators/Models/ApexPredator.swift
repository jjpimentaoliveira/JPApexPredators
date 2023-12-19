//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String

    func typeOverlay() -> Color {
        switch type {
        case "air":
            return .teal
        case "land":
            return .brown
        case "sea":
            return .blue
        default:
            return .brown // default case
        }
    }
}
