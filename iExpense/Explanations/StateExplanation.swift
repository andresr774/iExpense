//
//  StateExplanation.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateExplanation: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct StateExplanation_Previews: PreviewProvider {
    static var previews: some View {
        StateExplanation()
    }
}
