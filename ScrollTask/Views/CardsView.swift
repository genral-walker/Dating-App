import SwiftUI

struct CardsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Cards View")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

#Preview("Cards View in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
