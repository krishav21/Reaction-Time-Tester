//
// BouncyButtonStyle.swift
// Reaction Time Tester
//
// Created by Krishav Bepari on 10/14/2025.
//

import SwiftUI

struct BouncyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(.orange, in: .capsule)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.spring.speed(1.5), value: configuration.isPressed)
    }
}
