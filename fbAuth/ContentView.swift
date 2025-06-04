import SwiftUI
import FBSDKLoginKit
import FirebaseAuth

struct ContentView: View {
    @State private var userName = "Not logged in"

    var body: some View {
        VStack(spacing: 30) {
            Text(userName)
                .font(.title2)
                .padding()

            Button(action: {
                loginWithFacebook()
            }) {
                HStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    Text("Login with Facebook")
                        .bold()
                }
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }

    func loginWithFacebook() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
            if let error = error {
                print("FB login failed: \(error.localizedDescription)")
                return
            }

            guard let accessToken = AccessToken.current?.tokenString else {
                print("Failed to get access token")
                return
            }

            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)

            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("Firebase sign in failed: \(error.localizedDescription)")
                } else if let user = result?.user {
                    userName = user.displayName ?? "No Name"
                    print("Logged in as: \(user.email ?? "unknown email")")
                }
            }
        }
    }
}
