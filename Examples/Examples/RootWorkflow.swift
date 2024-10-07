//
//  RootWorkflow.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI
import DeclarativeRoute

struct RootWorkflow: View {
    var body: some View {
        NavigationStack {
            DocumentList()
                .onRoute(
                    /DocumentList.Route.detail,
                     transition: NavigateTransition()
                ) { documentId in
                    DocumentDetails(documentId: documentId)
                }
        }
    }
}
