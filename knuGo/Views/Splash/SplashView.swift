//
//  SplashView.swift
//  knuGo
//
//  Created by lmw on 2022/05/07.
//

import SwiftUI

struct Splash {
    let title: String
    let sub : String
}

struct SplashView: View {
    
    let splash = Splash(title: "KNU Go", sub: "Find your best place")
    
    @State var touched = false
    
    var body: some View {
        VStack{
            Text(splash.title)
                .font(.title)
                .foregroundColor(.secondary)
            
            StartButtonView(touched: $touched)
            
            Text(splash.sub)
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            
            
        }
        .padding(touched ? 100 : 30)
        .background(self.touched ? Color.white: Color.red)
        .cornerRadius(60)
    }
}



struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
