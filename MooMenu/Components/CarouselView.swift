//
//  CarouselView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/27/24.
//

// This is for sliding carousel view windows

import SwiftUI

struct CarouselView: View {
    // For keeping track of image to show
    @State var index: Int
    var body: some View {
        VStack {
            TabView(selection: $index) {
                
            }
        }
        .frame(height:200)
    }
}

#Preview {
    CarouselView(index: 0)
}
