import SwiftUI

// MARK: - Main App Entry Point
struct ContentView: View {
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CardsView()
                .tabItem {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                    Text("Cards")
                }
                .badge(10)
                .tag(0)
            
            BonfireView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Bonfire")
                }
                .tag(1)
            
            MatchesView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Matches")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.white)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
