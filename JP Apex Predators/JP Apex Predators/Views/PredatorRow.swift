//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by José João Pimenta Oliveira on 19/12/2023.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredator
    var body: some View {
        HStack {

            // Dino image
            Image(predator.name.lowercased().filter { $0 != " "})
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1, x: 0, y: 0)

            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(.bold)

                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    )
            }
        }
    }
}

#Preview {
    let movieScene = MovieScene(
        id: 1,
        movie: "Jurassic Park",
        sceneDescription: "A velociraptor appears in the very first scene in Jurassic Park when Muldoon and his team try to bring a female into the park. It attacks one of the team members and they are forced to shoot it. They don’t appear then until far later in the film when Ellie and Muldoon have to restore the park’s power systems. Muldoon realises they’re being hunted by them and tells Ellie to run to the power shed as he tracks a Velociraptor with his gun. She restores the power and finds what’s left of Ray and she narrowly escapes from a Velociraptor. Muldoon is still tracking a raptor when the female ambushes him, killing him. The raptors appear again in the visitor center when Lex and Tim are eating. They hide in the kitchen and avoid being detected. They managed to trap one of them and escape. The raptors catch up with the group in the control room so Ellie, Dr. Grant, Tim and Lex escape through the vents and into the main lobby area of the visitor center. They fall to the ground and are about to be attacked by two Velociraptors when the Tyrannosaur appears, killing both of them. The survivors use this opportunity to escape the island."
    )

    return PredatorRow(predator: ApexPredator(
        id: 2,
        name: "Velociraptor",
        type: "land",
        movies: [
            "Jurassic Park",
            "The Lost World: Jurassic Park",
            "Jurassic Park III",
            "Jurassic World",
            "Jurassic World: Fallen Kingdom"
        ],
        movieScenes: [movieScene],
        link: "https://jurassicpark.fandom.com/wiki/Velociraptor"
    ))
    .preferredColorScheme(.dark)
    .previewLayout(.sizeThatFits)
}
