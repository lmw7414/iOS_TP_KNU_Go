//
//  LandMarkRow.swift
//  knuGo2
//
//  Created by lmw on 2022/05/06.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            if landmark.isVisited {
                landmark.image
                    .resizable()
                    .frame(width: 50, height: 50).clipShape(Circle())
                Text(landmark.name)
                Spacer()
                Image("badge")
                    .resizable()
                    .frame(width: 50, height: 50)
            }else {
                ZStack {
                    landmark.image
                        .resizable()
                        .grayscale(0.9995)
                        .frame(width: 50, height: 50).clipShape(Circle())
                    Text("?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                }
                
                Text(landmark.name)
                Spacer()
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
