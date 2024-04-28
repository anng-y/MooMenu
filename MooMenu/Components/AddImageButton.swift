//
//  AddImageButton.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct AddImageButton: View {
    var body: some View {
        Button {
            // add images of recipe
            AddImageView()
        } label: {
            Text("Add your plate!")
                .frame(width: 270, height: 50)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .foregroundStyle(.blue)
        }
        Spacer()

    }
}

#Preview {
    AddImageButton()
}
