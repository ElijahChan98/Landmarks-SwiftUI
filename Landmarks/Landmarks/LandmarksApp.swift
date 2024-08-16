//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Elijah on 8/13/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
