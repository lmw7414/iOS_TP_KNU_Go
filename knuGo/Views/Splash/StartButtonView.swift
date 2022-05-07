//
//  StartButtonView.swift
//  knuGo
//
//  Created by lmw on 2022/05/07.
//

import SwiftUI

struct StartButtonView: View {
    
    @Binding var touched: Bool
    
    var body: some View {
        Button(action: {
            withAnimation{
                self.touched.toggle()
            }
        }){
            if(self.touched){
                Image(systemName: "figure.stand")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 100))
            }else {
                Image(systemName: "figure.walk")
                    .foregroundColor(Color.black)
                    .font(.system(size: 200))
            }
        }
        
        .padding(20)
    }
}


