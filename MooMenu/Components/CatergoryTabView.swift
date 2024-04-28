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
            ScrollView (.horizontal, showsIndicators: true) {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) { // Increased spacing between buttons
                        Button {
                            // recipe list for all food
                        } label: {
                            Text("All Foods")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.green) // Green background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for vegetarian
                        } label: {
                            Text("Vegetarian")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.blue) // Blue background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for dairy free
                        } label: {
                            Text("No Dairy")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.orange) // Orange background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for vegan
                        } label: {
                            Text("Vegan")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.purple) // Purple background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for peanut free
                        } label: {
                            Text("No Peanut")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.red) // Red background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for gluten free
                        } label: {
                            Text("No Gluten")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.yellow) // Yellow background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                        Button {
                            // recipe list for egg free
                        } label: {
                            Text("No Eggs")
                                .font(.headline) // Larger font size for main categories
                                .foregroundColor(.white) // White text color
                                .padding(.horizontal, 20) // Increased horizontal padding
                                .padding(.vertical, 10) // Increased vertical padding
                                .background(Color.gray) // Gray background color
                                .clipShape(Capsule()) // Capsule shape for buttons
                        }
                    }
                    .padding() // Padding for the entire HStack
                }
            }
            
        }
    }
}

#Preview {
    CatergoryTabView()
}
