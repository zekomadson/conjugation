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
    private let db = Firestore.firestore()
    private let collectionName = "BaseVerbs"
    
    init(currentVerb: Verb) {
        self.currentVerb = currentVerb
    }
   
    // TODO: Grab the next verb
}
