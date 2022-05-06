//
//  knuGoApp.swift
//  knuGo
//
//  Created by lmw on 2022/04/30.
//

import SwiftUI


@main
struct knuGoApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

