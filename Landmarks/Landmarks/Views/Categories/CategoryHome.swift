//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Elijah on 8/13/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost().environment(modelData)
            })
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
