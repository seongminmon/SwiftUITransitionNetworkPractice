//
//  RandomImageView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/4/24.
//

import SwiftUI

struct SectionTitle: Hashable, Identifiable {
    let id = UUID()
    var title: String
}

struct RandomImageView: View {
    
    @State private var sectionTitles: [SectionTitle] = [
        SectionTitle(title: "트렌드"),
        SectionTitle(title: "풍경/자연"),
        SectionTitle(title: "인물")
    ]
    
    var randomURL: URL? {
        return URL(string: "https://picsum.photos/id/\(Int.random(in: 1...100))/200/300")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($sectionTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.title.wrappedValue)
                            .font(.title)
                            .bold()
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(0..<5) { index in
                                    NavigationLink {
                                        DetailRandomImageView(title: item.title)
                                    } label: {
                                        AsyncImage(url: randomURL) { data in
                                            switch data {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                            case .failure(_):
                                                Image(systemName: "star")
                                            @unknown default:
                                                Image(systemName: "star")
                                            }
                                        }
                                        .frame(width: 200, height: 300)
                                    }
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("RandomImage")
            }
        }
    }
}

#Preview {
    RandomImageView()
}
