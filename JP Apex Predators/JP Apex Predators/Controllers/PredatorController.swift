//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import Foundation

class PredatorController {
    private var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]

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
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error decoding json data: \(error)")
            }
        }
    }

    func sortByAlphabetical() {
        apexPredators.sort(by: { $0.name < $1.name })
    }

    func sortByMovieAppearance() {
        apexPredators.sort(by: { $0.id < $1.id })
    }

    func typeIcon(for type: String) -> String {
        switch type {
        case "Air":
            return "wind"
        case "All":
            return "square.stack.3d.up.fill"
        case "Land": 
            return "lead.fill"
        case "Sea":
            return "drop.fill"
        default:
            return "questionmark"
        }
    }

    func filterBy(type: String) {
        switch type {
        case "Land", "Air", "Sea":
            apexPredators = allApexPredators.filter { $0.type == type.lowercased() }
        case "All":
            apexPredators = allApexPredators
        default:
            apexPredators = allApexPredators
        }
    }
}
