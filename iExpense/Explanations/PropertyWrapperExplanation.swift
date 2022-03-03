//
//  PropertyWrapperExplanation.swift
//  iExpense
//
//  Created by Andres camilo Raigoza misas on 2/03/22.
//

import SwiftUI

struct PropertyWrapperExplanation: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .onChange(of: blurAmount) { newValue in
            print("BlurAmount: \(newValue)")
        }
    }
}

struct PropertyWrapperExplanation_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperExplanation()
    }
}
