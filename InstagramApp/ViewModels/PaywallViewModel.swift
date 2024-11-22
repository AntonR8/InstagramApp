import SwiftUI
import AdSupport
import ApphudSDK
import Observation
import AppTrackingTransparency
import StoreKit

@Observable
class PaywallViewModel {

    enum ApphudPlacement {
    //    case onboarding
    //    case proButtonPushed
    //    case afterLimitationsReached
    //    case settings
        case test

        var placementIdentifier: String {
            switch self {
    //        case .onboarding: "onboarding"
    //        case .proButtonPushed: "proButtonPushed"
    //        case .afterLimitationsReached: "afterLimitationsReached"
    //        case .settings: "settings"
            case .test: "test"
            }
        }
    }

    private var currentPlacement: ApphudPlacement = .test
    private var currentPaywall: ApphudPaywall?
    var products: [ApphudProduct] = []
    var selectedProductIndex = 0

    init() {
        Task {
            await Apphud.start(apiKey: "app_Lq3Eoit1CwyroaFcfpW2RyHXdekMfF")
            await loadProducts(for: currentPlacement)
        }

        Apphud.setDeviceIdentifiers(idfa: nil, idfv: UIDevice.current.identifierForVendor?.uuidString)
        fetchIDFA()
    }

    @MainActor private func loadProducts(for placement: ApphudPlacement) async {
        Apphud.fetchPlacements { placements, apphudError in
            guard let actualPlacement = placements.first(where: { $0.identifier == placement.placementIdentifier })
            else {
                if let apphudError {
                    print(apphudError.localizedDescription)
                }
                return }

            guard let actualPaywall = actualPlacement.paywall else { return }
            self.currentPaywall = actualPaywall

            self.products = actualPaywall.products
            print("Продукты получены из Apphud: \(self.products.map { $0.name })")
        }
    }

    func updatedSelectedProductIndex(_ index: Int) {
        selectedProductIndex = index
    }

    @MainActor func makePurchase() {

        guard let selectedProduct = products[safe: selectedProductIndex]
        else {
            print("При попытке осуществления покупки выбранный продукт не найден в списке загруженных продуктов")
            return
        }

        Apphud.purchase(selectedProduct) {result in
            if let error = result.error {
                DispatchQueue.main.async {
//                    self.firstRun = false
                }
                print("Ошибка выполнения Apphud.purchase")
                debugPrint(error.localizedDescription)
            }
            if let subscription = result.subscription, subscription.isActive() {
//                self.showPaywall = false
                DispatchQueue.main.async {
//                    self.firstRun = false
                }
            } else if let purchase = result.nonRenewingPurchase, purchase.isActive() {
//                self.showPaywall = false
                DispatchQueue.main.async {
//                    self.firstRun = false
                }
            } else {
                if Apphud.hasActiveSubscription() {
//                    self.showPaywall = false
                    DispatchQueue.main.async {
//                        self.firstRun = false
                    }
                }
            }
        }
    }

    func func1() {
        if Apphud.hasPremiumAccess() {
            // проверка на любую активную покупку
        }
    }


    @MainActor func restorePurchase() {
        Apphud.restorePurchases {subscriptions, _, error in
            if let error = error {
                print("Ошибка восставноления подписки")
                debugPrint(error.localizedDescription)
                // подписка не активка либо другая ошибка - обработка ошибку
            }
            if subscriptions?.first?.isActive() ?? false {
//                self.showPaywall = false
                return
            }

            if Apphud.hasActiveSubscription() {
//                self.showPaywall = false
            }
        }
    }

    func returnSubscriptionViewParameters(subscription: ApphudProduct) -> (subscriptionName: String, pricePerYear: String?, bestOffer: Bool, pricePerPeriod: String, period: String)? {
        switch subscription.productId {
        case "yearly": (subscriptionName: "Annual", pricePerYear: "Just $0.42 per week", bestOffer: true, pricePerPeriod: "$19.99", period: "per year")
        case "weekly": (subscriptionName: "Weekly", pricePerYear: nil, bestOffer: false, pricePerPeriod: "$4.99", period: "per week")
        default: nil
        }
    }


    func disableContinueButton() -> Bool {
        guard
            !products.isEmpty,
            let _ = products[safe: selectedProductIndex]
        else { return true }

        return false
    }

    // добавлено по рекомендации консультанта AppHud для решения ошибки с идентификатором устройства:
    func fetchIDFA() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
            ATTrackingManager.requestTrackingAuthorization { status in
                guard status == .authorized else {return}
                let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                Apphud.setDeviceIdentifiers(idfa: idfa, idfv: UIDevice.current.identifierForVendor?.uuidString)
            }
        }
    }


}

// добавлено по рекомендации консультанта AppHud:
extension ApphudPurchaseResult {
    var success: Bool {
        subscription?.isActive() ?? false ||
            nonRenewingPurchase?.isActive() ?? false ||
            (Apphud.isSandbox() && transaction?.transactionState == .purchased)
    }
}
