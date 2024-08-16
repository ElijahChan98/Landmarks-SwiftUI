//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Elijah on 8/13/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly: Bool = false

    var filteredLandmarks: [Landmark] {
        return modelData.landmarks.filter { $0.isFavorite == true || !showFavoritesOnly }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
