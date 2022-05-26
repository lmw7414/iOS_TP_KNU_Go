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
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    @State private var region = MKCoordinateRegion()
    
    @EnvironmentObject var modelData: ModelData
    
    
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
                    Image(systemName: "moon.stars.fill").resizable()
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

struct MapView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MapView()
            .environmentObject(modelData)
    }
}
