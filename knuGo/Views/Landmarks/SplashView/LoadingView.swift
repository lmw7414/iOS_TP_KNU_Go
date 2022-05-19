//
//  LoadingView.swift
//  knuGo
//
//  Created by JiHyeok on 2022/05/07.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI
 
struct LoadingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                Text("KNU Go")
                    .font(.system(size: 50))
                LottieView(filename: "Loading")
                    .frame(width: 400, height: 400)
                NavigationLink {
                    MainView()
                } label: {
                    Text("GO!")
                }
            }
        }.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}
