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
        if isSet{
            Image("badge")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
