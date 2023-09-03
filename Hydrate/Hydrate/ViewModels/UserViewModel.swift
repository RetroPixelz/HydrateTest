//
//  UserViewModel.swift
//  Hydrate
//
//  Created by Justin Koster on 2023/09/03.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserViewModel: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var userLoggedIn: Bool = false
    
    func getUserDetails() {
        let userId = getUserId()
        
        db.collection("users").document(userId).getDocument { [weak self] document, error in
            guard let self = self else { return }
            
            if let document = document, document.exists {
                if let userData = try? document.data(as: User.self) {
                    print("The user data should have decoded")
                    print("-----------\(userData)")
                } else {
                    print(error?.localizedDescription ?? "Problem with decoding document")
                }
            }
        }
    }
    
    func getUserId() -> String {
        return Auth.auth().currentUser?.uid ?? "No user id found"
    }
    
    func hasUserLoggedInPrev() -> Bool {
        if Auth.auth().currentUser?.uid != nil {
//            userLoggedIn = true
            print("Logged")
            return true
        } else {
//            userLoggedIn = false
            print("Not logged")
            return false
        }
    }
}
