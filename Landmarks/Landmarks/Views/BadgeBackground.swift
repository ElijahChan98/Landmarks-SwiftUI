//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Elijah on 8/13/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(
                to: CGPoint(
                    x: width * 0.95,
                    y: height * 0.20
                )
            )

            HexagonParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y
                    )

                )
            }
        }
        .fill(.black)
    }
}

#Preview {
    BadgeBackground()
}
