import SwiftUI

struct ChatRow: View {
    let name: String
    let message: String
    let time: String
    let isVoice: Bool
    let voiceDuration: String?
    let isNewChat: Bool
    let badge: Int?
    var subtitle: String? = nil
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Picture
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.green, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 24))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    if isNewChat {
                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 6, height: 6)
                            Text("New chat")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.purple.opacity(0.3))
                        .cornerRadius(12)
                    }
                    
                    if let sub = subtitle {
                        Text(sub)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                if isVoice {
                    HStack(spacing: 8) {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.purple)
                            .font(.system(size: 14))
                        
                        // Voice Waveform
                        HStack(spacing: 2) {
                            ForEach(0..<8) { i in
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.purple)
                                    .frame(width: 3, height: CGFloat.random(in: 8...20))
                            }
                        }
                        
                        Text(voiceDuration ?? "")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                    }
                } else if !message.isEmpty {
                    Text(message)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }
            
            if let count = badge {
                ZStack {
                    Circle()
                        .fill(.purple)
                        .frame(width: 24, height: 24)
                    Text("\(count)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                }
            } else if isNewChat {
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.gray.opacity(0.3)))
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.black)
    }
}

// MARK: - Preview
#Preview("Chat Row in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
