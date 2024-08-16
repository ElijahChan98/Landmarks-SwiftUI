//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Elijah on 8/14/24.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            Text("First Hike")
                            Text("earth day")
                            Text("Tenth Hike")
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}
