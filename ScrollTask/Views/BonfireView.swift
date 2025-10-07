import SwiftUI

struct BonfireView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Bonfire View")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}
