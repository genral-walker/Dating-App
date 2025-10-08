import SwiftUI

struct MatchesView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Top Section - Your Turn
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Your Turn")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(.white)
                            
                            ZStack {
                                Circle()
                                    .fill(.purple)
                                    .frame(width: 28, height: 28)
                                Text("7")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            // Profile Picture
                            ZStack(alignment: .topTrailing) {
                                Image("userProfile")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.green)
                                
                                Text("90")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .offset(x: 5, y: -5)
                            }
                        }
                        
                        Text("Make your move, they are waiting 🎵")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .italic()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 16)
                    
                    // Card Carousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            CardView(
                                name: "Amanda, 22",
                                question: "What is your most favorite childhood memory?",
                                gradient: [.green, .purple],
                                hasNotification: false
                            )
                            
                            CardView(
                                name: "Malte, 31",
                                question: "What is the most important quality in friendships to you?",
                                gradient: [.brown, .orange],
                                hasNotification: true
                            )
                            
                            CardView(
                                name: "Emma, 25",
                                question: "If you could have dinner with anyone, who would it be?",
                                gradient: [.blue, .purple],
                                hasNotification: false
                            )
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 200)
                    .padding(.bottom, 24)
                    
                    // Chats Section
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 20) {
                            Text("Chats")
                                .font(.system(size: 24, weight: .semibold))
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
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                        Text("The ice is broken. Time to hit it off")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .italic()
                            .padding(.horizontal)
                            .padding(.top, 12)
                            .padding(.bottom, 16)
                        
                        // Chat List
                        ScrollView {
                            VStack(spacing: 0) {
                                ChatRow(
                                    name: "Jessica",
                                    message: "",
                                    time: "6:21 pm",
                                    isVoice: true,
                                    voiceDuration: "00:58",
                                    isNewChat: true,
                                    badge: nil
                                )
                                
                                ChatRow(
                                    name: "Amanda",
                                    message: "Lol I love house music too",
                                    time: "6:21 pm",
                                    isVoice: false,
                                    voiceDuration: nil,
                                    isNewChat: false,
                                    badge: nil,
                                    subtitle: "Your move"
                                )
                                
                                ChatRow(
                                    name: "Sila",
                                    message: "You: I love the people there tbh, have you been?",
                                    time: "Wed",
                                    isVoice: false,
                                    voiceDuration: nil,
                                    isNewChat: false,
                                    badge: nil
                                )
                                
                                ChatRow(
                                    name: "Marie",
                                    message: "Hahaha that's interesting, it does seem like people here are startin...",
                                    time: "6:21 pm",
                                    isVoice: false,
                                    voiceDuration: nil,
                                    isNewChat: false,
                                    badge: 4,
                                    subtitle: "Your move"
                                )
                                
                                ChatRow(
                                    name: "Jessica",
                                    message: "",
                                    time: "6:21 pm",
                                    isVoice: false,
                                    voiceDuration: nil,
                                    isNewChat: false,
                                    badge: nil,
                                    subtitle: "Your move"
                                )
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Preview
#Preview("Matches View in Context") {
    ContentView()
        .preferredColorScheme(.dark)
}
