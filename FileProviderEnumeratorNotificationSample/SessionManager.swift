//
//  SessionManager.swift
//  FileProviderEnumeratorNotificationSample
//
//  Created by Marcin Krzyzanowski on 20/10/2021.
//

import Foundation
import FileProvider
import SwiftUI
import Combine

enum SignInStatus {
    case signedIn
    case signedOut
}

final class SessionManager: ObservableObject {
    static let appAccessGroup = "group.best.swift.FileProviderEnumeratorNotificationSample"
    static var shared = SessionManager()

    private var signinStatusValue: Bool {
        get {
            userDefaults.bool(forKey: "signin-status")
        }
        set {
            userDefaults.set(newValue, forKey: "signin-status")
        }
    }

    private var userDefaults = UserDefaults(suiteName: appAccessGroup)!
    private var cancellabes: Set<AnyCancellable> = []

    var status: SignInStatus {
        signinStatusValue ? .signedIn : .signedOut
    }

    init() {
        NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: .main) { notification in
            self.objectWillChange.send()
        }
    }

    func signIn() {
        signinStatusValue = true
        signalEnumerator()
    }

    func signOut() {
        signinStatusValue = false
        signalEnumerator()
    }

    private func signalEnumerator() {
        NSFileProviderManager.default.signalEnumerator(for: .rootContainer) { signalError in
            if let signalError = signalError {
                assertionFailure("\(signalError)")
            }
        }
    }
}
