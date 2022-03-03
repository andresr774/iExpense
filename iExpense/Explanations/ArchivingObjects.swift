//
//  ArchivingObjects.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingObjects: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ArchivingObjects_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingObjects()
    }
}
