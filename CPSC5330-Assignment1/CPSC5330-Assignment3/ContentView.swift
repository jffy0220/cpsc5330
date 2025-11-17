//
//  ContentView.swift
//  CPSC5330-Assignment4
//
//  Created by Justin Farley on 11/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var moodValue: Double = 50
    @State private var moodDescription: String = "Neutral 😐"
    @State private var selectedDate: Date = Date()
    @State private var savedMood: String = ""

    var body: some View {
        VStack(spacing: 25) {
            
            Text("Select Your Mood")
                .font(.title2)
                .bold()
            
            Slider(value: $moodValue, in: 0...100, step: 1)
                .padding(.horizontal)
                .onChange(of: moodValue) { _, _ in
                    updateMoodDescription()
                }

            Text(moodDescription)
                .font(.title)
                .bold()
                .padding(.bottom, 20)
            
            VStack(spacing: 8) {
                Text("Choose Date:")
                    .font(.headline)
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
            }

            Button(action: saveMood) {
                Text("Save Mood")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            if !savedMood.isEmpty {
                Text(savedMood)
                    .font(.title3)
                    .padding(.top, 20)
            }

            Spacer()
        }
        .padding()
    }

    private func updateMoodDescription() {
        switch moodValue {
        case 0...20:
            moodDescription = "Very Sad 😢"
        case 21...40:
            moodDescription = "Sad 🙁"
        case 41...60:
            moodDescription = "Neutral 😐"
        case 61...80:
            moodDescription = "Happy 🙂"
        default:
            moodDescription = "Very Happy 😄"
        }
    }

    private func saveMood() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        let dateString = formatter.string(from: selectedDate)
        savedMood = "On \(dateString), you felt \(moodDescription.split(separator: " ").last ?? "🙂")"
    }
}

#Preview {
    ContentView()
}
