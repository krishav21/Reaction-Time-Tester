//
// TestTopBar.swift
// Reaction Time Tester
//
// Created by Krishav Bepari on 10/14/2025.
//

import SwiftUI

struct TestTopBar: View {
    @Binding var manager: TestManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: -4.0) {
            Text(manager.bestRT, format: .number.precision(.fractionLength(3)))
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .contentTransition(.numericText(value: manager.bestRT))
            
            Text("Best Reaction Time")
                .font(.caption)
                .fontWeight(.semibold)
                .textCase(.uppercase)
        }
        .multilineTextAlignment(.leading)
        .padding(16.0)
    }
}
