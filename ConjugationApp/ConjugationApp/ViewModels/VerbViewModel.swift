//
//  VerbViewModel.swift
//  ConjugationApp
//
//  Created by Zeko Madson on 10/5/25.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseAuth

class VerbViewModel: ObservableObject {
    let currentVerb: Verb
    let dayNum: Int
    private let db = Firestore.firestore()
    private let collectionName = "BaseVerbs"
    
    
    init(dayNum: Int) {
        self.dayNum = dayNum
        self.currentVerb = BaseVerbData.baseVerbs[dayNum % BaseVerbData.baseVerbs.count] // Return Verb
    }

    // TODO: Function to grab current day's verb
    func generateDailyVerb() {
        
    }
    
    
    // TODO: Generate new conjugation
    func newConjugation() {
        currentVerb.genNewConjugation()
    }
}
