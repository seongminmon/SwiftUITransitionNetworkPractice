//
//  CategoryView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/4/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
    
    var text: String {
        return "\(name) (\(count))"
    }
}

struct CategoryView: View {
    
    private let item = ["SF", "가족", "스릴러"]
    
    @State private var text = ""
    @State private var genreList = [
        Category(name: "SF", count:  .random(in: 1...100)),
        Category(name: "가족", count: .random(in: 1...100)),
        Category(name: "스릴러", count: .random(in: 1...100))
    ]
    
    private var filterGenre: [Category] {
        return text.isEmpty ? genreList : genreList.filter { $0.name.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterGenre, id: \.self) { item in
                    NavigationLink {
                        CategoryDetailView(data: item)
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text(item.text)
                        }
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(
                text: $text,
                placement: .navigationBarDrawer,
                prompt: "유저를 검색해보세요"
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("추가 탭")
                        let genre = Category(name: item.randomElement()!, count: .random(in: 1...100))
                        genreList.append(genre)
                    } label: {
                        Text("추가")
                    }
                }
            }
        }
    }
}

struct CategoryDetailView: View {
    
    var data: Category
    
    var body: some View {
        Text("CategoryDetailView \(data.text)")
    }
}

#Preview {
    CategoryView()
}
