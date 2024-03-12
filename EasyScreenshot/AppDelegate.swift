import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
  var statusBarItem: NSStatusItem?
  func applicationDidFinishLaunching(_ notification: Notification) {
    
    statusBarItem = NSStatusBar.system
      .statusItem(withLength: NSStatusItem.squareLength)
    if let statusBarButton = statusBarItem?.button {
      statusBarButton.image = NSImage(
        systemSymbolName: "cursorarrow.rays",
        accessibilityDescription: nil
      )
    }
    
    let mainMenu = NSMenu()
    
    /// Creating menu item: area capture
    let itemSelectArea = NSMenuItem(
      title: "Select an area",
      action: #selector(self.actionSelectArea),
      keyEquivalent: "")
    itemSelectArea.image = NSImage(
      systemSymbolName: "rectangle.dashed",
      accessibilityDescription: nil
    )
    itemSelectArea.target = self
    mainMenu.addItem(itemSelectArea)
    
    /// Creating menu item: entire screen capture
    let itemCaptureEntireScreen = NSMenuItem(
      title: "Screenshot the entire screen",
      action: #selector(self.actionCaptureEntireScreen),
      keyEquivalent: "")
    itemCaptureEntireScreen.image = NSImage(
      systemSymbolName: "macwindow.on.rectangle",
      accessibilityDescription: nil
    )
    itemCaptureEntireScreen.target = self
    mainMenu.addItem(itemCaptureEntireScreen)
    
    /// Creating menu item: window capture
    let itemCaptureWindow = NSMenuItem(
      title: "Capture a window",
      action: #selector(self.actionCaptureWindow),
      keyEquivalent: "")
    itemCaptureWindow.image = NSImage(
      systemSymbolName: "macwindow",
      accessibilityDescription: nil
    )
    itemCaptureWindow.target = self
    mainMenu.addItem(itemCaptureWindow)
    
    /// Creating a divider
    mainMenu.addItem(.separator())
    
    /// Creating menu item:  quit the app
    let itemQuit = NSMenuItem(
      title: "Quit EasyScreenshot",
      action: #selector(self.actionExitApp),
      keyEquivalent: "")
    itemQuit.target = self
    mainMenu.addItem(itemQuit)
    
    statusBarItem?.menu = mainMenu
  }
  
  @objc private func actionExitApp() {
    NSApp.terminate(self)
  }
  
  @objc private func actionCaptureEntireScreen() {
    ScreenCaptureUtil.screenshot(type: .EntireScreen)
  }
  
  @objc private func actionSelectArea() {
    ScreenCaptureUtil.screenshot(type: .UserSelection)
  }
  
  @objc private func actionCaptureWindow() {
    ScreenCaptureUtil.screenshot(type: .Window)
  }
}
