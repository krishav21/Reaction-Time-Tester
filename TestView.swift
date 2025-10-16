//
// TestView.swift
// Reaction Time Tester
//
// Created by Krishav Bepari on 10/14/2025.
//

import SwiftUI

struct TestView: View {
    @State private var manager: TestManager = .init()
    @AppStorage("bestReactionTime") private var bestReactionTime: TimeInterval = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text(manager.reactionTimeText)
                .foregroundStyle(!manager.hasFailed ? .white : .red)
                .font(.largeTitle)
                .fontWeight(.black)
                .fontDesign(.rounded)
                .contentTransition(.numericText(value: manager.reactionTime))
                .padding()
            
            RaceLights(manager: $manager)
            
            Spacer()
            
            CapsuleButton(text: !manager.hasTestReset ? "Reset" : "Start", isCircular: false) { 
                if !manager.hasTestReset {
                    manager.resetTest()
                } else {
                    manager.setTest()
                }
            }
        }
        .modifier(BackgroundModifier(manager: $manager))
        .onChange(of: manager.bestRT) { bestReactionTime = manager.bestRT }
        .onAppear {
            if manager.timerState != .finished { manager.setTest() }
            manager.bestRT = bestReactionTime
        }
    }
}
