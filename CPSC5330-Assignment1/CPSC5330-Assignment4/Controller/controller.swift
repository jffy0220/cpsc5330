//
//  controller.swift
//  CPSC5330-Assignment4
//
//  Created by Justin Farley on 11/23/25.
//

import Foundation

class GameController: ObservableObject {

    @Published var currentNode: ModelNode?

    private var nodes: [String: ModelNode] = [:]

    init() {
        setupGame()
        currentNode = nodes["start"]
    }

    // -------------------------------------

    func choose(_ choice: Choice) {
        if let nextID = choice.nextNodeID {
            currentNode = nodes[nextID]
        } else {
            // Ending node
            currentNode = ModelNode(
                text: choice.isSuccessEnding ?
                    "'If I knew you'd let yourself get captured that easily. I would've just dangled a turkey leg on a rope from the ceiling.' - Success. You have escaped the Oregon trail. Ready for your next challenge?" :
                    "You have died of dysentery..",
                choices: []
            )
        }
    }

    // -------------------------------------

    private func setupGame() {

        nodes["start"] = ModelNode(
            text: "Your wagon breaks down trying to cross the river. Do you fish or hunt for food?",
            choices: [
                Choice(title: "Fish", nextNodeID: "fish", isSuccessEnding: false),
                Choice(title: "Hunt", nextNodeID: nil, isSuccessEnding: false)
            ]
        )

        nodes["fish"] = ModelNode(
            text: "You caught a good fish. What do you do next?",
            choices: [
                Choice(title: "Start searching for fire wood.", nextNodeID: "firewood", isSuccessEnding: false),
                Choice(title: "Eat the fish immediately.", nextNodeID: "eatFish", isSuccessEnding: false)
            ]
        )

        nodes["firewood"] = ModelNode(
            text: "You come across several fallen tree limbs. On one of them is a piece of cake. Do you take the cake?",
            choices: [
                Choice(title: "The cake is a lie.", nextNodeID: "cakeisalie", isSuccessEnding: false),
                Choice(title: "Eat the cake.", nextNodeID: nil, isSuccessEnding: false)
            ]
        )

        nodes["eatfish"] = ModelNode(
            text: "You eat the fish, raw. How will you wash it down?’",
            choices: [
                Choice(title: "Drink from your canteen.", nextNodeID: "waterCanteen", isSuccessEnding: false),
                Choice(title: "Drink from the river.", nextNodeID: nil, isSuccessEnding: false)
            ]
        )

        nodes["cakeisalie"] = ModelNode(
            text: "You have ignored the cake. A blue portal opens before you. Do you enter it?",
            choices: [
                Choice(title: "No.", nextNodeID: nil, isSuccessEnding: true),
                Choice(title: "Yes.", nextNodeID: nil, isSuccessEnding: false)
            ]
        )

        nodes["waterCanteen"] = ModelNode(
            text: "The water tastes great. What will you do next?",
            choices: [
                Choice(title: "Wash off in the river.", nextNodeID: nil, isSuccessEnding: false),
                Choice(title: "Go to sleep.", nextNodeID: nil, isSuccessEnding: false)
            ]
        )
    }
}
