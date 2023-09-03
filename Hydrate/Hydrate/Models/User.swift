//
//  UserData.swift
//  Hydrate
//
//  Created by Justin Koster on 2023/09/03.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?

    var email: String
    var steps: Double
    var time: Date
    var username: String
    var water: Double
}
