//
//  ContentView.swift
//  knuGo2
//
//  Created by lmw on 2022/04/30.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    var body: some View {
           LoadingView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
