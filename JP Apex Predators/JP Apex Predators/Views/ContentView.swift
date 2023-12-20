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
    @State private var currentFilter = "All"

    var body: some View {

        predatorController.filterBy(type: currentFilter)

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
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    }, label: {
                        sortAlphabetical
                            ? Image(systemName: "film")
                            : Image(systemName: "textformat")
                    })
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(predatorController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    Spacer()
                                    Image(systemName: predatorController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
