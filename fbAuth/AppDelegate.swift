/*
 AppDelegate code is to initialize Firebase and Facebook SDKs when the iOS application launches, and to handle URLs opened by the app—such as Facebook login redirects
 
 Starting ✅

 Going to background 😴

 Getting opened with some link (like Facebook login redirect) 🔗
 
 App starts 🟢

 AppDelegate runs 🔁

 Firebase & Facebook SDKs get ready ✅
 
 */


//UI framework
import UIKit

// Firebase core functionality.
import FirebaseCore

//Facebook SDK tools
import FBSDKCoreKit


class AppDelegate: NSObject, UIApplicationDelegate {
    
    //this is the class that controls your whole iOS app.
    //This function runs right after your app starts.
    func application(_ application: UIApplication ,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //It starts Firebase engine inside your app.
        //It reads your GoogleService-Info.plist file inside your Xcode project.
        FirebaseApp.configure()
        
        //This sets up the Facebook login system inside your app.
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //✅ Yes bro, my app launched properly. No problems."
        return true
    }
    
    
    //This function runs when your app is opened using a URL
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //Ey Facebook SDK, someone logged in da... Here’s the return URL. Finish the login and give user data.
        ApplicationDelegate.shared.application(app, open: url, options: options)
        
    }
}
