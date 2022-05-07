//
//  SplashContentView.swift
//  knuGo
//
//  Created by lmw on 2022/05/07.
//

import SwiftUI

let middleView = SplashView()

struct SplashContentView: View {
    @State var index = 0
    
    private var backgroundColors = [
        Color.yellow,
        Color.white,
        Color.red
    ]
    
    var body: some View {
            
        VStack {
            Text("KNU Go")
                .font(.caption)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                
            Spacer()
            SplashView()
                .padding(40)
            Spacer ()
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            if(self.index == self.backgroundColors.count-1){
                self.index = 0
            }else {
                self.index += 1
            }
        }
    }
}

struct SplashContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashContentView()
    }
}
