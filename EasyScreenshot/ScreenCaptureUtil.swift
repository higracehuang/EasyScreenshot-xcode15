import Foundation

enum ScreenshotType {
  case EntireScreen
  case Window
  case UserSelection
}

class ScreenCaptureUtil {
  
  static func screenshot(type: ScreenshotType) {
    let task = Process()
    task.launchPath = "/usr/sbin/screencapture"
    
    switch type {
    case .EntireScreen:
      task.arguments = ["-cm"]
    case .Window:
      task.arguments = ["-cw"]
    case .UserSelection:
      task.arguments = ["-cs"]
    }
    
    task.launch()
    task.waitUntilExit()
  }
}
