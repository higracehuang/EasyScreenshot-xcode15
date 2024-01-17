import SwiftUI

@main
struct EasyScreenshotApp: App {
  
  @NSApplicationDelegateAdaptor(AppDelegate.self)
  private var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
