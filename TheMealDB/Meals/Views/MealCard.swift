//
//  MealCard.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//

import SwiftUI

struct MealCard: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Image(systemName: "home")
            VStack {
                Spacer()
                Text("Hello, World!")
                Button {
                    
                } label: {
                    Text("Add")
                }
                .padding()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .background(
                    isAnimating ? Color.red : Color.blue
                )
        )
    }
}

#Preview {
    MealCard()
}
