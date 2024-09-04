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
        SectionTitle(title: "인물"),
        SectionTitle(title: "건축")
    ]
    
    var randomURL: URL? {
        return URL(string: "https://picsum.photos/id/\(Int.random(in: 1...100))/100/150")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($sectionTitles, id: \.id) { item in
                    sectionView(sectionTitle: item)
                }
            }
            .navigationTitle("RandomImage")
        }
    }
    
    func sectionView(sectionTitle: Binding<SectionTitle>) -> some View {
        VStack(alignment: .leading) {
            Text(sectionTitle.title.wrappedValue)
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { _ in
                        let url = randomURL
                        NavigationLink {
                            NavigationLazyView(DetailRandomImageView(
                                title: sectionTitle.title,
                                url: url
                            ))
                        } label: {
                            PosterView(url: url)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
        }
    }
}

#Preview {
    RandomImageView()
}

struct PosterView: View {
    
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { data in
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
        .frame(width: 100, height: 150)
    }
}
