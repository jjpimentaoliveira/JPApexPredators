//
//  MovieScene.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import Foundation

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
