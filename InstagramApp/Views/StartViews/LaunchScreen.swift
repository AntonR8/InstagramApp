import SwiftUI
import AppTrackingTransparency
import StoreKit

struct LaunchScreen: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var movement = false
    @State var size: CGFloat = 50

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("")
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation(.linear(duration: 1)) {
                            movement = true
                        }
                    }
                }

            if movement {
                Image("logo")
                    .resizable()
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)) 
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                    .onAppear{
                        navigationViewModel.userViews += 1
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                            withAnimation {
                                size = 150
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            movement = false
                            navigationViewModel.launchScreenOpacity = 0
                        }
                    }
            }
        }
    }


}

#Preview {
    LaunchScreen()
        .environment(NavigationViewModel())
}
