//
//  model.swift
//  CPSC5330-Assignment4
//
//  Created by Justin Farley on 11/23/25.
//

import Foundation

struct ModelNode: Identifiable {
    let id = UUID()
    let text: String
    let choices: [Choice]
}

struct Choice {
    let title: String
    let nextNodeID: String?   // nil = ending
    let isSuccessEnding: Bool
}
