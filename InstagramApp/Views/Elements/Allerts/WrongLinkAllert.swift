
import SwiftUI

struct WrongLinkAllert: ViewModifier {
    @Bindable var mainViewModel: MainViewModel
    @Binding var showInstruction: Bool

    func body(content: Content) -> some View {
        content
            .alert("Wrong link pasted", isPresented: $mainViewModel.showWrongLinkAlert) {
                Button("Close",  action: {
                    mainViewModel.showWrongLinkAlert = false
                })
                .accentColor(.accent)
                Button("Read instructions", action: {
                    showInstruction = true
                })
            } message: {
                Text("This link does not fit, enter another one or read our instructions")
            }

    }
}


extension View {
    func wrongLinkAllert(mainViewModel: MainViewModel, showInstruction: Binding<Bool>) -> some View {
        modifier(WrongLinkAllert(mainViewModel: mainViewModel, showInstruction: showInstruction))
    }
}
