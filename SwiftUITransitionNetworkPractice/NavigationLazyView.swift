//
//  NavigationLazyView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    var body: some View {
        build()
    }
    
    init(_ closure: @autoclosure @escaping () -> Content) {
        self.build = closure
        print("NavigationLazyView Init")
    }
}
