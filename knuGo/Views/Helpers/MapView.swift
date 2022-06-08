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
                        .onTapGesture(count: 1, perform: {
                            viewChanger.currentPage = .viewer2
                                          })
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

struct MapView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MapView()
            .environmentObject(modelData)
    }
}
