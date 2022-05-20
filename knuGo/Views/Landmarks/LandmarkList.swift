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
    
    @State var btnpressed = false
    
    @GestureState private var dragOffset = CGSize.zero

    
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
            }
            .listStyle(PlainListStyle()).headerProminence(.increased)
            .navigationTitle(" ")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    print("button was tapped")
                                    btnpressed = true
                                    MapAnnotationView().annotationclicked = false
                                }) {
                                    Image(systemName: "arrow.left")
                                }
                            }
            }
            .navigate(to: MapAnnotationView(), when: $btnpressed)
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
                               if(value.startLocation.x < 20 && value.translation.width > 100) {
                                   MapAnnotationView().annotationclicked = false
                                   btnpressed = true
                               }
            
                           }))
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
