//
//  view.swift
//  CPSC5330-Assignment4
//
//  Created by Justin Farley on 11/23/25.
//

import SwiftUI

struct GameView: View {

    @StateObject private var controller = GameController()

    var body: some View {
        VStack(spacing: 30) {

            Text(controller.currentNode?.text ?? "")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()

            ForEach(controller.currentNode?.choices ?? []) { choice in
                Button(action: {
                    controller.choose(choice)
                }) {
                    Text(choice.title)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            
            if (controller.currentNode?.choices.isEmpty ?? true) {
                Button(action: {
                    controller.restart()
                }) {
                    Text("Restart Adventure")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }

            Spacer()
        }
        .padding()
    }
}

extension Choice {
    var id: String { title }
}
