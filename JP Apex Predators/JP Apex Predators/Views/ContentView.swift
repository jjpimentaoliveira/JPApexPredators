//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    let predatorController = PredatorController()
    @State private var sortAlphabetical = false

    var body: some View {
        sortAlphabetical
            ? predatorController.sortByAlphabetical()
            : predatorController.sortByMovieAppearance()
        
        return NavigationView {
            List {
                ForEach(predatorController.apexPredators) { predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        sortAlphabetical.toggle()
                    }, label: {
                        sortAlphabetical
                            ? Image(systemName: "film")
                            : Image(systemName: "textformat")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
