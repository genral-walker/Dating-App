import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Profile View")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

// MARK: - Preview
#Preview("Profile View in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
