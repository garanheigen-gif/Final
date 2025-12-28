//
//  DecoVeiw.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/12/5.
//

import SwiftUI

extension Color {
    static let themePurple = Color(red: 132/255, green: 124/255, blue: 222/255)
    static let lightLavender = Color(red: 179/255, green: 176/255, blue: 245/255)
    static let darkLavender = Color(red: 133/255, green: 130/255, blue: 161/255)
    static let darkDialog  = Color(red: 22/255, green: 33/255, blue: 62/255)
}

struct DotGridBackground: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            
            Path { path in
                for x in stride(from: 0, through: width, by: 20) {
                    for y in stride(from: 0, through: height, by: 20) {
                        path.addEllipse(in: CGRect(x: x, y: y, width: 2, height: 2))
                    }
                }
            }
            .fill(Color.gray.opacity(0.9))
        }
        .ignoresSafeArea()
    }
}
