//
//  ContentView.swift
//  EnvironmentObjectExample
//
//  Created by Mohamed Osama on 10/12/2023.
//

import SwiftUI

class DataExample: ObservableObject {
    @Published var title: String = "Intial Title"
    @Published var description: String = "Intial Description"
}

struct ContentView: View {
    @EnvironmentObject var data: DataExample
    var body: some View {
        VStack {
            Text("Hello, iOS Developers")
            Text("\(data.title) \n\(data.description)")
                .multilineTextAlignment(.center)
            EnvironmentView()
            AnotherEnvironmentView()
        }
        .environmentObject(data)
        .padding()
    }
}

struct EnvironmentView: View {
    @EnvironmentObject var data: DataExample
    var body: some View {
        Button("Update Some Attributes") {
            data.title = "New Title Value"
            data.description = "Hello, Mohamed Osama, You do a great job👏"
        }.environmentObject(data)
    }
}

struct AnotherEnvironmentView: View {
    @EnvironmentObject var data: DataExample
    var body: some View {
        VStack {
            Text("\(data.title) \n \(data.description)")
                .multilineTextAlignment(.center)
        }.environmentObject(data)
    }
}

#Preview {
    ContentView()
        .environmentObject(DataExample())
}
