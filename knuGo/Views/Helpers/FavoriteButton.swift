//
//  FavoriteButton.swift
//  knuGo2
//
//  Created by lmw on 2022/05/06.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "checkmark" : "checkmark")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .blue : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
