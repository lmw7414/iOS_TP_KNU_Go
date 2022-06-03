//
//  MapView.swift
//  knuGo2
//
//  Created by lmw on 2022/05/06.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    @State var annotationclicked = false
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    @State private var region = MKCoordinateRegion()
    
    @EnvironmentObject var modelData: ModelData
    
    @EnvironmentObject var viewChanger: ModelData
    
    var body: some View {
        Map(
           coordinateRegion: $manager.region,
           interactionModes: MapInteractionModes.all,
           showsUserLocation: true,
           userTrackingMode: $tracking,
           annotationItems: modelData.landmarks
        ){ place in
            MapAnnotation(coordinate: place.locationCoordinate){
                VStack {
                    NavigationView{
                        NavigationLink {
                            LandmarkList()
                        } label: {
                            Text("GO!")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .navigationTitle("Navigation Link")
                        
                      }
                    place.image.resizable()
                        .foregroundColor(.red)
                        .frame(width: 44, height: 44)
                        .background(.white).clipShape(Circle())
                    Text(place.name)
                }
                
            }
        }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        
        )
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

struct MapView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MapView()
            .environmentObject(modelData)
    }
}
