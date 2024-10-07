//
//  DocumentDetails.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import DeclarativeRoute
import SwiftUI

struct DocumentDetails: View {
    @RouteState var route: DocumentList.Route?
    
    let documentId: Int
    var body: some View {
        VStack {
            Text("Document \(documentId)")
            
            
            Button("Close") {
                route = nil
            }
            
            Button("Open other") {
                route = .detail(Int.random(in: 0..<100))
            }
        }
    }
}

#Preview {
    DocumentDetails(documentId: 33)
}
