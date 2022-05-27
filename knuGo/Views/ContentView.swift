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
    

    var body: some View {
        switch viewChanger.currentPage{
        case .viewer1:
            MapView()
        case .viewer2:
            LandmarkList()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
