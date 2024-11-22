//
//  TrendsView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI
import Observation

struct TrendsView: View {
    @State var trendsViewModel = TrendsViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(trendsViewModel.trendsMusic) {section in
                    TrendsSection(section: section)
                        .padding(.bottom)
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        TrendsView()
            .environment(NavigationViewModel())
    }
}
