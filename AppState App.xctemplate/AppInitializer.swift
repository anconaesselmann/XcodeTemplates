//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

import SwiftUI

@MainActor
class AppInitializer: ObservableObject {

    @Published
    var state: LoadableResult = .notStarted

    @MainActor
    func initialize() async {
        guard case .notStarted = state else {
            return
        }
        state = .loading
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)

            AppState.shared = AppState(

            )
            state = .success
        } catch {
            state = .failure(error)
        }
    }
}
