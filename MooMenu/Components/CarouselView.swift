////
////  CarouselView.swift
////  MooMenu
////
////  Created by Gavin Cartier on 4/27/24.
////
//
//// This is for sliding carousel view windows
//
//import SwiftUI
//
//struct CarouselView: View {
//    // For keeping track of image to show
//    @State var index: Int
//    var body: some View {
//        VStack {
//            TabView(selection: $index) {
//                ForEach((0..<3), id: \.self) { index in
//                    RecipeCardView(imageName: "spaghet.png", recipeName: "Example recipe name")
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//        }
//        
//        .frame(height: 300)
//    }
//}
//
//#Preview {
//    CarouselView(index: 0)
//}
