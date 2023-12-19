//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import Foundation

class PredatorController {
    var apexPredators: [ApexPredator] = []

    init() {
        // Decode apex predators as soon as we initialise a new PredatorController
        decodeApexPredatorData()
    }

    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // no need to have CodingKeys 🥳
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding json data: \(error)")
            }
        }
    }
}
