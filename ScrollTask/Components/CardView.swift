import SwiftUI

struct CardView: View {
    let name: String
    let question: String
    let gradient: [Color]
    let hasNotification: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Card Background
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: gradient),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 280, height: 180)
            
            // Notification Badge
            if hasNotification {
                HStack(spacing: 4) {
                    Text("📣 They made a move!")
                        .font(.system(size: 12, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(.black.opacity(0.9))
                .cornerRadius(20)
                .padding(12)
            }
            
            // Card Content
            VStack {
                Spacer()
                
                Text("Tap to answer")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.bottom, 20)
                
                Text(name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                Text(question)
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
            }
            .frame(width: 280, height: 180)
        }
    }
}

#Preview("Card View in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
