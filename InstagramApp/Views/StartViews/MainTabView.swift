import SwiftUI
import ApphudSDK

struct MainTabView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel


//    @State var savedViewPickerSelection = "Videos"
//
    var body: some View {
        @Bindable var navigationViewModel = navigationViewModel
        NavigationStack() {
            TabView(selection: $navigationViewModel.tabSelection,
                    content: {
                Group {
                    MainView()
                        .tabItem {
                            Image(systemName: "play.house.fill")
                            Text("Main")
                        }.tag(1)
                    TrendsView()
                        .tabItem {
                            Text("Trends")
                            Image(systemName: "music.note.list")
                        }.tag(2)
                    CollectionsView()
                        .tabItem {
                            Text("Collections")
                            Image(systemName: "bookmark")
                        }.tag(3)

                }
                .toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            })
            .accentColor(.black)
            .toolbar {
                if !Apphud.hasPremiumAccess() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            navigationViewModel.showPaywall = true
                        } label: {
                            ProButtonView()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                            .foregroundStyle(.black)
                    }
                }
            }
             .navigationTitle(navigationViewModel.returnNavigationTitle())
            .fullScreenCover(isPresented: $navigationViewModel.showPaywall) {
                PaywallView()
            }

        }
        .accentColor(navigationViewModel.albumViewIsShowing ? .white : .accentColor)
    }
}

#Preview {
    MainTabView()
        .environment(NavigationViewModel())
}
