//
//  CartItemView.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//

import SwiftUI

class CartItemDataSource: ObservableObject {
    @Published var cartItems: [MealItem] = [] {
        didSet {
            total = cartItems.map { item in
                item.meal.price * item.quantity
            }.reduce(0, +)
        }
    }
    @Published var total: Int = 0
}

protocol CartItemViewDelegate {
    func increaseQuantity(for meal: MealItem)
    func decreaseQuantity(for meal: MealItem)
    func didSelectCheckout()
}

struct CartItemView: View {
    @ObservedObject var datasource: CartItemDataSource
    var delegate: CartItemViewDelegate?
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(self.datasource.cartItems, id: \.meal.id) { option in
                
                        HStack {
                            VStack(alignment: .leading) {
                                Text(option.meal.name)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.primary)
                                    .id(option.id)
                                Text("$\(option.meal.price)")
                                    .font(.footnote)
                                    .foregroundStyle(Color.primary)
                            }
                            
                            
                            Spacer()
                            
                            Button {
                                delegate?.decreaseQuantity(for: option)
                            } label: {
                                Image(systemName: "minus.circle")
                            }

                            Text("\(option.quantity)")
                                .font(.subheadline)
                                .frame(width: 50)
                            
                            Button {
                                delegate?.increaseQuantity(for: option)
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                        .padding()
                    Divider()
                }
            }
            .listStyle(.inset)
         
            Button {
                if self.datasource.total > 0 {
                    delegate?.didSelectCheckout()
                }
            } label: {
                Text("Checkout ($\(self.datasource.total))")
                    .font(.system(.callout, weight: .semibold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .foregroundColor(.white)
                    .background(self.datasource.total > 0 ? .blue : .gray)
                    .mask { RoundedRectangle(cornerRadius: 16, style: .continuous) }
                    .padding(.horizontal)
                    .padding(.bottom)
            }

        }
    }
}
