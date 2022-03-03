//
//  UserDefaultsExplanation.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

struct UserDefaultsExplanation: View {
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            //UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct UserDefaultsExplanation_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExplanation()
    }
}
