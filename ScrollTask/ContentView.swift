import SwiftUI

// To fix, the top of the app is different across devices
// The bottom also
/*
- The height of the slides
*/

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


#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
