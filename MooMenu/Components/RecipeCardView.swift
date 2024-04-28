////
////  RecipeCardView.swift
////  MooMenu
////
////  Created by Gavin Cartier on 4/27/24.
////
//
//import SwiftUI
//
//struct RecipeCardView: View {
//    var imageName: String // Name of the image to use
//    var recipeName: String // Name of the recipe
//    
//    
//    var body: some View {
//        // Overlayed image with text
//        ZStack {
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height:300)
//                .cornerRadius(10)
//                .padding()
//            
//            VStack {
//                Spacer()
//                
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(Color.white)
//                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .bottom, endPoint: .top))
//                    //Background text for added emphasis
//                    Text(recipeName)
//                        .font(.system(size:30))
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                        .offset(x:1, y:1)
//                    
//                    Text(recipeName)
//                        .font(.system(size:30))
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                        .cornerRadius(10)
//                }
//                .frame(height:160)
//                
//            }
//            .frame(height:300)
//            .padding()
//        }
//        
//        
//    }
//}
//
//#Preview {
//    RecipeCardView(imageName: "spaghet.png", recipeName: "Example recipe name")
//}
