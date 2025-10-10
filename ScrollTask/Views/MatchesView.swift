import SwiftUI


private struct MatchData {
    let name: String
    let question: String
    let gradient: [Color]
    let hasNotification: Bool
}

private struct ChatData {
    let name: String
    let message: String
    let time: String
    let isVoice: Bool
    let voiceDuration: String?
    let isNewChat: Bool
    let badge: Int?
    let subtitle: String?
}

struct MatchesView: View {
    @State private var selectedSegment = 0
    
    
    private let matches: [MatchData] = [
        MatchData(
            name: "Amanda, 22",
            question: "What is your most favorite childhood memory?",
            gradient: [.green, .purple],
            hasNotification: false
        ),
        MatchData(
            name: "Malte, 31",
            question: "What is the most important quality in friendships to you?",
            gradient: [.brown, .orange],
            hasNotification: true
        ),
        MatchData(
            name: "Emma, 25",
            question: "If you could have dinner with anyone, who would it be?",
            gradient: [.blue, .purple],
            hasNotification: false
        )
    ]
    
    private let chats: [ChatData] = [
        ChatData(
            name: "Jessica",
            message: "",
            time: "6:21 pm",
            isVoice: true,
            voiceDuration: "00:58",
            isNewChat: true,
            badge: nil,
            subtitle: nil
        ),
        ChatData(
            name: "Amanda",
            message: "Lol I love house music too",
            time: "6:21 pm",
            isVoice: false,
            voiceDuration: nil,
            isNewChat: false,
            badge: nil,
            subtitle: "Your move"
        ),
        ChatData(
            name: "Sila",
            message: "You: I love the people there tbh, have you been?",
            time: "Wed",
            isVoice: false,
            voiceDuration: nil,
            isNewChat: false,
            badge: nil,
            subtitle: nil
        ),
        ChatData(
            name: "Marie",
            message: "Hahaha that's interesting, it does seem like people here are startin...",
            time: "6:21 pm",
            isVoice: false,
            voiceDuration: nil,
            isNewChat: false,
            badge: 4,
            subtitle: "Your move"
        ),
        ChatData(
            name: "Jessica",
            message: "",
            time: "6:21 pm",
            isVoice: false,
            voiceDuration: nil,
            isNewChat: false,
            badge: nil,
            subtitle: "Your move"
        )
    ]

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    VStack {
                        // Top Section - Your Turn
                        VStack(alignment: .leading, spacing: -5) {
                            HStack {
                                Text("Your Turn")
                                    .font(.system(size: scaledSize(34, for: geometry.size.width), weight: .bold))
                                    .foregroundColor(.white)
                                
                                ZStack {
                                    Circle()
                                        .fill(.purple)
                                        .frame(width: scaledSize(28, for: geometry.size.width), 
                                               height: scaledSize(28, for: geometry.size.width))
                                    Text("7")
                                        .font(.system(size: scaledSize(14, for: geometry.size.width), weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                // Profile Picture
                                ZStack(alignment: .center) {
                                    
                                    Circle()
                                        .trim(from: 0.1, to: 0.87)
                                        .stroke(
                                            AngularGradient(
                                                gradient: Gradient(stops: [
                                                    .init(color: Color(hex: "#4C8D25"), location: 0.0),
                                                    .init(color: Color(hex: "#4C8D25"), location: 0.7),
                                                    .init(color: Color(hex: "#4C8D25").opacity(0.5), location: 0.85),
                                                    .init(color: Color(hex: "#4C8D25").opacity(0.0), location: 1.0)
                                                ]),
                                                center: .center,
                                                startAngle: .degrees(0),
                                                endAngle: .degrees(360)
                                            ),
                                            style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)
                                        )
                                        .frame(width: scaledSize(67, for: geometry.size.width),
                                               height: scaledSize(67, for: geometry.size.width))
                                        .rotationEffect(.degrees(96))  // Position the fade at the right side
                                        
                                    
                                    
                                    Circle()
                                        .fill(.black)
                                        .frame(width: scaledSize(60, for: geometry.size.width),
                                               height: scaledSize(60, for: geometry.size.width))
                                    
                                    
                                    Image(.profile)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: scaledSize(50, for: geometry.size.width), 
                                               height: scaledSize(50, for: geometry.size.width))
                                        .offset(y: 10)
                                        .clipShape(Circle())
                                      
                                    
                                   Text("90")
                                       .font(.system(size: scaledSize(12, for: geometry.size.width), weight: .bold))
                                       .foregroundColor(.white)
                                        .frame(width: scaledSize(40, for: geometry.size.width),
                                               height: scaledSize(20, for: geometry.size.width))
                                       .background(Color(hex: "#12161F"))
                                       .cornerRadius(10)
                                       .offset( y: 35)
                                }
                            }
                           
                            
                            Text("Make your move, they are waiting 🎵")
                                .font(.system(size: scaledSize(16, for: geometry.size.width)))
                                .foregroundColor(.customGrey)
                                .italic()
                             
                        }
                        .padding(.horizontal, horizontalPadding(for: geometry.size.width))
                        .padding(.top, geometry.safeAreaInsets.top + 8)
                        .padding(.bottom, 16)
                    
                        // Card Carousel
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(matches, id: \.name) { match in
                                    CardView(
                                        name: match.name,
                                        question: match.question,
                                        gradient: match.gradient,
                                        hasNotification: match.hasNotification
                                    )
                                }
                            }
                            .padding(.horizontal, horizontalPadding(for: geometry.size.width))
                        }
                        .frame(height: cardHeight(for: geometry.size.width))
                        .padding(.top, 20)
                        .padding(.bottom, 24)
                        
                        // Chats Section
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 20) {
                                Text("Chats")
                                    .font(.system(size: scaledSize(24, for: geometry.size.width), weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 4)
                                    .overlay(
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(height: 2)
                                            .offset(y: 18)
                                        , alignment: .bottom
                                    )
                                
                                Text("Pending")
                                    .font(.system(size: scaledSize(24, for: geometry.size.width), weight: .semibold))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, horizontalPadding(for: geometry.size.width))
                            .padding(.top, 8)
                            
                            Text("The ice is broken. Time to hit it off")
                                .font(.system(size: scaledSize(14, for: geometry.size.width)))
                                .foregroundColor(.gray)
                                .italic()
                                .padding(.horizontal, horizontalPadding(for: geometry.size.width))
                                .padding(.top, 12)
                                .padding(.bottom, 16)
                        
                            // Chat List
                            ScrollView {
                                VStack(spacing: 0) {
                                    ForEach(chats, id: \.name) { chat in
                                        ChatRow(
                                            name: chat.name,
                                            message: chat.message,
                                            time: chat.time,
                                            isVoice: chat.isVoice,
                                            voiceDuration: chat.voiceDuration,
                                            isNewChat: chat.isNewChat,
                                            badge: chat.badge,
                                            subtitle: chat.subtitle
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    
    /// Scales any size proportionally based on screen width
    /// Base reference: iPhone 15 (393pt width)
    private func scaledSize(_ size: CGFloat, for width: CGFloat) -> CGFloat {
        let baseWidth: CGFloat = 393 // iPhone 15 as reference
        let scaleFactor = width / baseWidth
        // Clamp scaling between 80% and 105% to prevent extreme sizes
        let clampedFactor = min(max(scaleFactor, 0.8), 1.05)
        return size * clampedFactor
    }
    
    /// Returns appropriate horizontal padding based on screen width
    private func horizontalPadding(for width: CGFloat) -> CGFloat {
        if width < 350 {
            return 16 // iPhone SE - tighter padding
        } else if width < 400 {
            return 20 // Standard iPhones
        } else {
            return 24 // Larger devices
        }
    }
    
    /// Returns card height that scales with screen width
    private func cardHeight(for width: CGFloat) -> CGFloat {
        // Card height should be proportional to width for consistent aspect ratio
        return scaledSize(180, for: width)
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview

#Preview("Matches View in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
