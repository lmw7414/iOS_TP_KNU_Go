//
//  ContentView.swift
//  knuGo2
//
//  Created by lmw on 2022/04/30.
//

import SwiftUI
import MapKit
import CoreLocation


struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct MapAnnotationView: View {
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow

    @State var annotationclicked = false
    
    @EnvironmentObject var viewChanger: ModelData
    
    let places = [
        Place(name: "Position 1", latitude: 31.21, longitude: 120.50),
        Place(name: "Position 2", latitude: 31.210205, longitude: 120.52301),
        Place(name: "Position 3", latitude: 31.230006, longitude: 120.54002)
    ]
    
    var body: some View {
        Map(
           coordinateRegion: $manager.region,
           interactionModes: MapInteractionModes.all,
           showsUserLocation: true,
           userTrackingMode: $tracking,
           annotationItems: places
        ){ place in
            MapAnnotation(coordinate: place.coordinate){
                VStack {
//                        NavigationView{
//                            NavigationLink(destination: LandmarkList()) {
//                            }
//                            .navigationTitle("Navigation Link")
//                          }
                    Image(systemName: "moon.stars.fill").resizable()
                        .foregroundColor(.red)
                        .frame(width: 44, height: 44)
                        .background(.white).clipShape(Circle())
                    Text(place.name)
                }
                .onTapGesture(count: 1, perform: {
//                    annotationclicked = true
                    viewChanger.currentPage = .viewer2
                })

            }
        }
//        .navigate(to: LandmarkList(), when: $annotationclicked)
    }
}

struct ContentView: View {
    
    
    @EnvironmentObject var viewChanger: ModelData
    
    var body: some View {
        switch viewChanger.currentPage{
        case .viewer1:
            MapAnnotationView()
        case .viewer2:
            LandmarkList()
//                .transition(.scale)
//            print("add new view")
        }
        
    }
}

extension View {
    // 여러번의 화면 전환시 오류 발생함
    // (ZStack 방식 올바르지 않게 사용해서 그런 것으로 추정됨. viewChanger 방식으로 수정함.)
    //  새로운 view로 이동한다.
    //   - view: 이동할 view
    //   - binding: 이 값이 true일때만 navigate가 실행된다.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    ,isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
//            .environmentObject(ViewChanger())

    }
}
