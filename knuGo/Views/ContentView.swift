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


struct ContentView: View {
        
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow

    let places = [
        Place(name: "Position 1", latitude: 31.21, longitude: 120.50),
        Place(name: "Position 2", latitude: 31.210205, longitude: 120.52301),
        Place(name: "Position 3", latitude: 31.230006, longitude: 120.54002)
    ]

    
    var body: some View {
        VStack(spacing: 0){
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
            MapView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
