import SwiftUI

public struct UILoadingView: View {
  
  public init() { }
  
  public var body: some View {
    ZStack {
      SwiftUI.Color(UIColor.white)
      
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: (SwiftUI.Color(UIColor.primary500))))
    }
    
  }
}

struct UILoadingView_Previews: PreviewProvider {
  static var previews: some View {
    UILoadingView()
  }
}
