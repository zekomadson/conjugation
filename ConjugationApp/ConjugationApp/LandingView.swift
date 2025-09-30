//
//  LandingView.swift
//  ConjugationApp
//
//  Created by Zeko Madson on 9/30/25.
//

import SwiftUI

struct LandingView: View {
    // State variables for user interaction
    @State private var userInput = ""
    @State private var showResult = false
    @State private var isCorrect = false
    
    // Mock data - In production, this would come from your data model
    let currentVerb = "Pensar"
    let verbMeaning = "To Think"
    let currentTense = "Present - First Person Singular"
    let correctAnswer = "pienso"
    let examplePhrase = "I think about my family"
    
    var body: some View {
        VStack(spacing: 40) {
            // Header Section
            VStack(spacing: 20) {
                Text("Verb of the Day")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(currentVerb)
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(verbMeaning)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 40)
            
            // Challenge Section
            VStack(spacing: 16) {
                Text("Conjugate in:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(currentTense)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Example: \(examplePhrase)")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(.vertical, 20)
            
            // Input Section
            VStack(spacing: 20) {
                TextField("Type your answer", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onSubmit {
                        checkAnswer()
                    }
                
                Button(action: checkAnswer) {
                    Text("Check Answer")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(userInput.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(userInput.isEmpty)
                
                // Result Display
                if showResult {
                    HStack(spacing: 12) {
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(isCorrect ? .green : .red)
                            .font(.title2)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(isCorrect ? "Correct!" : "Not quite right")
                                .fontWeight(.semibold)
                            
                            if !isCorrect {
                                Text("Correct answer: \(correctAnswer)")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(isCorrect ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                    .cornerRadius(10)
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            // Bottom Action
            Button(action: generateNewChallenge) {
                Label("New Tense", systemImage: "arrow.clockwise")
                    .font(.callout)
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
    
    // MARK: - Functions
    
    private func checkAnswer() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            isCorrect = userInput.lowercased().trimmingCharacters(in: .whitespaces) == correctAnswer.lowercased()
            showResult = true
        }
        
        // Hide keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func generateNewChallenge() {
        // Reset the state
        withAnimation {
            userInput = ""
            showResult = false
            isCorrect = false
        }
        
        // TODO: Generate new tense/challenge
        // This would pull from your data model
        print("Generate new tense")
    }
}

#Preview {
    LandingView()
}
