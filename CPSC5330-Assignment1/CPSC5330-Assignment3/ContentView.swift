//
//  ContentView.swift
//  CPSC5330-Assignment3
//
//  Created by Justin Farley on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    private let buttons: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 12) {
                VStack(alignment: .trailing, spacing: 8) {
                    Text("13×20=")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.gray)
                    Text("260")
                        .font(.system(size: 64, weight: .bold))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .shadow(radius: 2)
                .padding(.horizontal)
                .padding(.top, 20)

                Spacer()
                VStack(spacing: 10) {
                    ForEach(buttons, id: \.self) { row in
                        HStack(spacing: 10) {
                            ForEach(row, id: \.self) { label in
                                Button(action: {}) {
                                    Text(label)
                                        .font(.system(size: 28, weight: .semibold))
                                        .frame(maxWidth: label == "0" ? geo.size.width * 0.45 : .infinity,
                                               maxHeight: geo.size.width * 0.18)
                                        .background(buttonColor(label))
                                        .foregroundColor(.white)
                                        .cornerRadius(geo.size.width * 0.045)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
    private func buttonColor(_ label: String) -> Color {
        if ["÷", "×", "−", "+", "="].contains(label) {
            return Color.orange
        } else if ["AC", "+/-", "%"].contains(label) {
            return Color(.systemGray)
        } else {
            return Color(.darkGray)
        }
    }
}

#Preview {
    ContentView()
}

