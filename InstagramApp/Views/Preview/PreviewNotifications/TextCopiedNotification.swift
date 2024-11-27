//
//  TextCopiedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct TextCopiedNotification: View {
    var mainViewModel: MainViewModel
    var body: some View {
        CapsuleNotification(message: "Text copied")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showTextCopied = false
                }
            }
    }
}

#Preview {
    TextCopiedNotification(mainViewModel: MainViewModel())
}
