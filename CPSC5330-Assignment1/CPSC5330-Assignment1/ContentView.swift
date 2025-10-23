//
//  ContentView.swift
//  CPSC5330-Assignment1
//
//  Created by Justin Farley on 10/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("denver")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.tint)
            Text("My name is Justin, this is my dog Denver. Welcome to my project!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
