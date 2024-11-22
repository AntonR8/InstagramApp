//
//  FifthView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct FifthView: View {
    @AppStorage("firstRun") var firstRun = true

    var body: some View {
        ZStack {
            VStack {
                Image("onboarding5")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer()
                VStack() {
                    Text("Allow notifications 🔔")
                        .font(.title)
                        .bold()
                        .padding()
                    Text("Always stay on trend")
                        .font(.footnote)
                    Spacer()
                    Button {
                        requestAuthorization()
                    } label: {
                        OnboardingButtonLabel(title: "Turn on notifications")
                    }
                    DotsNavigationView(number: 4).opacity(0)
                }

                .padding()
                .background(.white)
                .multilineTextAlignment(.center)
                .clipped()
                .cornerRadius(25)
                .frame(height: 300)
            }
            .navigationBarBackButtonHidden(true)
            .overlay(alignment: .topTrailing) {
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, backGroundStyle: .clear) {
//                    firstRun = false
//                    paywallViewModel.showPaywall = true
//                    mainViewModel.launchScreenOpacity = 0
                }.padding()
            }
        }
    }

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if let error = error {
                print("Ошибка или отказ: \(error)")
            } else {
                switch success {
                case true:
                    print("Запрос на отправку уведомлений одобрен")
                case false: print("Запрос на отправку уведомлений отклонен")
                }
            }
        }
    }
}

#Preview {
    FifthView()
}
