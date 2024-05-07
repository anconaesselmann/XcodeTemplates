//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___

import SwiftUI

@main
struct ___PACKAGENAME:identifier___App: App {

    @StateObject
    private var appInitializer = AppInitializer()

    var body: some Scene {
        WindowGroup {
            switch appInitializer.state {
            case .notStarted, .loading:
                ProgressView()
                    .task { await initialize() }
            case .success:
                ZStack {
                    ContentView()
                }
            case .failure(let error):
                Text("App could not load: \(error.localizedDescription)")
            }
        }
    }

    private func initialize() async {
        await appInitializer.initialize()
    }
}
