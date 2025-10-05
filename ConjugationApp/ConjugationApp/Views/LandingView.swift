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
        ZStack {
            // Background gradient to match app theme
            LinearGradient(
                colors: [Color.indigo.opacity(0.05), Color.purple.opacity(0.03)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Header Section
                VStack(spacing: 20) {
                    Text("Verb of the Day")
                        .font(.headline)
                        .foregroundColor(.indigo.opacity(0.7))
                    
                    Text(currentVerb)
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.indigo, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
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
                        .foregroundColor(.indigo)
                    
                    Text("Example: \(examplePhrase)")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.indigo.opacity(0.05))
                )
                
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
                            .background(
                                LinearGradient(
                                    colors: userInput.isEmpty ? [Color.gray, Color.gray.opacity(0.8)] : [Color.indigo, Color.purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                            .shadow(color: userInput.isEmpty ? .clear : .indigo.opacity(0.2), radius: 8, y: 4)
                    }
                    .disabled(userInput.isEmpty)
                    
                    // Result Display
                    if showResult {
                        HStack(spacing: 12) {
                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isCorrect ? .green : .red)
                                .font(.title2)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(isCorrect ? "¡Excelente!" : "Not quite right")
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
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isCorrect ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isCorrect ? Color.green.opacity(0.3) : Color.red.opacity(0.3), lineWidth: 1)
                        )
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Bottom Action
                Button(action: generateNewChallenge) {
                    Label("New Tense", systemImage: "arrow.clockwise")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.indigo)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(Color.indigo.opacity(0.1))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.indigo.opacity(0.3), lineWidth: 1)
                        )
                }
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
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
