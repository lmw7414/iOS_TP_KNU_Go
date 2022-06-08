//
//  LandmarkList.swift
//  knuGo2
//
//  Created by lmw on 2022/05/06.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showVisitedOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showVisitedOnly || landmark.isVisited)
        }
    }
    
    @State var btnpressed = false
    @EnvironmentObject var viewChanger: ModelData
    @GestureState private var dragOffset = CGSize.zero

    
    var body: some View {
        
        
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $showVisitedOnly) {
                        Text("내가 방문한 곳")
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
                                    viewChanger.currentPage = .viewer1
                                    //MapAnnotationView().annotationclicked = false
                                }) {
                                    Image(systemName: "arrow.left")
                                }
                            }
            }
//            .navigate(to: MapView(), when: $btnpressed)
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
                               if(value.startLocation.x < 20 && value.translation.width > 100) {
//                                   MapAnnotationView().annotationclicked = false
                                   btnpressed = true
                                   viewChanger.currentPage = .viewer1
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
