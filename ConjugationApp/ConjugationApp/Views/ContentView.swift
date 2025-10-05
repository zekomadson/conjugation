//
//  ContentView.swift
//  ConjugationApp
//
//  Created by Zeko Madson on 9/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @StateObject private var verbVM = VerbViewModel(currentVerb: Verb.sampleVerb)
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color.indigo.opacity(0.1), Color.purple.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // App Icon/Logo area
                    Image(systemName: "book.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.indigo)
                        .scaleEffect(isAnimating ? 1.0 : 0.9)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                    
                    // App Title
                    VStack(spacing: 8) {
                        Text("Verbos")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundStyle(.indigo)
                        
                        Text("Master Spanish Conjugation")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    
                    // Tagline
                    Text("One verb at a time")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .italic()
                    
                    Spacer()
                    
                    // Enter Button
                    NavigationLink {
                        LandingView(verbVM: verbVM)
                    } label: {
                        HStack {
                            Text("Start Learning")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Image(systemName: "arrow.right")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: 280)
                        .padding(.vertical, 18)
                        .background(
                            LinearGradient(
                                colors: [Color.indigo, Color.purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .shadow(color: .indigo.opacity(0.3), radius: 10, y: 5)
                    }
                    .padding(.bottom, 60)
                }
                .padding()
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    ContentView()
}
