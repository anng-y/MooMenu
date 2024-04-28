//
//  CatergoryTabView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct CatergoryTabView: View {
    var body: some View {
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Button {
                        // recipe list for all food
                    } label: {
                        Text("All foods")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for vegetarian
                    } label: {
                        Text("Vegetarian")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for dairy free
                    } label: {
                        Text("No Dairy")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for vegan
                    } label: {
                        Text("Vegan")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for peanut free
                    } label: {
                        Text("No Peanut")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for gluten free
                    } label: {
                        Text("No Gluten")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        // recipe list for egg free
                    } label: {
                        Text("No Eggs")
                            .font(.body)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 40)
                            .background(.pink.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    CatergoryTabView()
}
