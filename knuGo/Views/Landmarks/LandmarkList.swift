//
//  LandmarkList.swift
//  knuGo2
//
//  Created by lmw on 2022/05/06.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || !landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        
        NavigationView {
            List {
                Section(header: Text("내가 가본 곳")) {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("아직 안가본곳")
                    }
                }.headerProminence(.increased)
                Section(header: Text("장소")){
                    ForEach(filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }.listStyle(PlainListStyle()).headerProminence(.increased)
        }.navigationBarTitle("Landmarks").navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
