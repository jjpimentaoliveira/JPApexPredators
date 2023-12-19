//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    let predatorController = PredatorController()

    var body: some View {
        NavigationView {
            List {
                ForEach(predatorController.apexPredators) { predator in
                    NavigationLink(destination: Text("Dino details go here")) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
        }
    }
}

#Preview {
    ContentView()
}
