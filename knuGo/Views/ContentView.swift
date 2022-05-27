//
//  ContentView.swift
//  knuGo2
//
//  Created by lmw on 2022/04/30.
//

import SwiftUI
import MapKit
import CoreLocation



struct ContentView: View {
    
    
    @EnvironmentObject var viewChanger: ModelData
    
//    var body: some View {
//<<<<<<< HEAD
//        VStack(spacing: 0){
//            Map(
//               coordinateRegion: $manager.region,
//               interactionModes: MapInteractionModes.all,
//               showsUserLocation: true,
//               userTrackingMode: $tracking,
//               annotationItems: places
//            ){ place in
//                MapAnnotation(coordinate: place.coordinate){
//                    VStack {
//                        NavigationView{
//                            NavigationLink {
//                                LandmarkList()
//                            } label: {
//                                Text("GO!")
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .navigationTitle("Navigation Link")
//
//                          }
//                        Image(systemName: "moon.stars.fill").resizable()
//                            .foregroundColor(.red)
//                            .frame(width: 44, height: 44)
//                            .background(.white).clipShape(Circle())
//                        Text(place.name)
//                    }
//
//                }
//            }
//            MapView()
//=======
    var body: some View {
        switch viewChanger.currentPage{
        case .viewer1:
            MapView()
        case .viewer2:
            LandmarkList()
//                .transition(.scale)
//            print("add new view")
        }
        
    }
}
//
//extension View {
//    // 여러번의 화면 전환시 오류 발생함
//    // (ZStack 방식 올바르지 않게 사용해서 그런 것으로 추정됨. viewChanger 방식으로 수정함.)
//    //  새로운 view로 이동한다.
//    //   - view: 이동할 view
//    //   - binding: 이 값이 true일때만 navigate가 실행된다.
//    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
//        NavigationView {
//            ZStack {
//                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//                NavigationLink(
//                    destination: view
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true)
//                    ,isActive: binding
//                ) {
//                    EmptyView()
//                }
//            }
//>>>>>>> 107ab4815e23c53ea316edee44e88f05b9a55071
//        }
//        .navigationViewStyle(.stack)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
//            .environmentObject(ViewChanger())

    }
}
