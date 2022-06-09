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
    @State private var showingAlert = false
    
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
                    if !place.isVisited  {
                            Button(action: {
                                        self.showingAlert = true
                                        
                                    }) {
                                        ZStack {
                                            place.image.resizable()
                                                .grayscale(0.9995)
                                                .foregroundColor(.red)
                                                .frame(width: 44, height: 44)
                                                .background(.white).clipShape(Circle())
                                            Text("?")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.red)
                                        }
                                    }
                        //Text(place.name)
                    }else {
                        Button(action: {
                            self.showingAlert = true
                        }){
                            ZStack {
                                place.image.resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white).clipShape(Circle())
                                Text(place.name)
                            }
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("\(place.name)"), message: Text("\(place.name) 도착"), dismissButton: .default(Text("확인")))
                        }
                        
                    }

//                      }
//                    place.image.resizable()
//                        .foregroundColor(.red)
//                        .frame(width: 44, height: 44)
//                        .background(.white).clipShape(Circle())
//                        .onTapGesture(count: 1, perform: {
//                            viewChanger.currentPage = .viewer2
//                                          })
//                    Text(place.name)
//                }
                

            }
            
        }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005)
        
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

