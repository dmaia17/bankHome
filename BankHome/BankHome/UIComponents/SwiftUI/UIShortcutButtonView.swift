import SwiftUI

public struct UIShortcutButtonView: View {
  private var iconImage: String = ""
  private var text: String = ""
  private var action: () -> Void
  
  public init(iconImage: String, text: String, action: @escaping () -> Void) {
    self.iconImage = iconImage
    self.text = text
    self.action = action
  }
  
  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .foregroundColor(SwiftUI.Color(UIColor.white))
        .shadow(color: SwiftUI.Color(UIColor.black).opacity(0.2), radius: 0.1, x: 0, y: 0.1)
        .onTapGesture {
          action()
        }
      
      SwiftUI.Image(uiImage: UIImage.getImage(name: iconImage))
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(16)
        .foregroundColor(SwiftUI.Color(UIColor.primary500))
      
      Text(text)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .padding(16)
    }
  }
}

struct UIShortcutButtonView_Previews: PreviewProvider {
  static var previews: some View {
    UIShortcutButtonView(iconImage: "ic_joyful", text: "abra sua conta", action: {})
  }
}
