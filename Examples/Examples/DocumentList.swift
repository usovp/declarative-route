//
//  DocumentList.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import DeclarativeRoute
import SwiftUI

struct DocumentList: View {
    @RouteState var route: Route?
    
    private let routes: [Int] = (0..<Int.random(in: 1..<16)).map { _ in Int.random(in: 0..<1000) }
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            ForEach(routes, id: \.self) { item in
                Text("Item \(item)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(.rect)
                    .onTapGesture {
                        route = .detail(item)
                    }
            }
        }
    }
    
    enum Route {
        case detail(Int)
    }
}
