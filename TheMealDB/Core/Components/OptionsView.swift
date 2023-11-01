//
//  OptionsView.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 1/11/23.
//

import SwiftUI

class OptionsViewDataSource: ObservableObject {
    @Published var options: [Optionable] = []
}

 struct OptionsView: View {
     @ObservedObject var datasource: OptionsViewDataSource
     var selectionAction: ((Optionable) -> ())
     
     var body: some View {
         VStack {
             List {
                 ForEach(self.datasource.options, id: \.optionValue) { option in
                     Button {
                         selectionAction(option)
                     } label: {
                         Text(option.optionValue)
                             .foregroundStyle(Color.gray)
                             .id(option.id)
                         
                     }
                 }
             }
             .listStyle(.inset)
             Divider()
         }
     }
 }
