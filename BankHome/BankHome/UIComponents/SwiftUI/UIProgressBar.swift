import SwiftUI

public struct UIProgressBar: View {
  private var value: Float
  
  public init(value: Float) {
    self.value = value
  }
  
  public var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
          .opacity(0.3)
          .foregroundColor(SwiftUI.Color(UIColor.primary500).opacity(0.5))
        
        Rectangle().frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
          .foregroundColor(SwiftUI.Color(UIColor.primary500))
      }.cornerRadius(8)
    }
  }
}

struct UIProgressBar_Previews: PreviewProvider {  
  static var previews: some View {
    UIProgressBar(value: 0.5)
      .frame(height: 16)
  }
}
