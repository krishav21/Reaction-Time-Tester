//
// BackgroundModifier.swift
// Reaction Time Tester
//
// Created by Krishav Bepari on 10/14/2025.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    @Binding var manager: TestManager
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topLeading) { TestTopBar(manager: $manager) }
            .contentShape(Rectangle())
            .background(.ultraThinMaterial)
            .onTapGesture { if manager.timerState != .finished { manager.stopTest() } }
    }
}
