import SwiftUI

public struct UIShortcutSubtitleIconView: View {
  private var title: String
  private var description: String?
  private var action: () -> Void
  
  public init(title: String, description: String? = nil, action: @escaping () -> Void) {
    self.title = title
    self.description = description
    self.action = action
  }
  
  public var body: some View {
    HStack(spacing: 0) {
      VStack(alignment: .leading, spacing: 8) {
        Text(title)
          .font(SwiftUI.Font(UIFont.caption))
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
          .padding(.trailing, 16)
        
        if let description {
          Text(description)
            .font(SwiftUI.Font(UIFont.labelCategory))
            .foregroundColor(SwiftUI.Color(UIColor.dark500))
            .padding(.trailing, 16)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.leading, 16)
      
      ZStack {
        SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_chevron_right"))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(SwiftUI.Color(UIColor.primary500))
      }
      .padding(.horizontal, 16)
    }
    .padding(.vertical, 16)
    .background(SwiftUI.Color(UIColor.white))
    .cornerRadius(8)
    .onTapGesture {
      action()
    }
  }
}

struct UIShortcutSubtitleIconView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SwiftUI.Color(UIColor.dark100)
      
      VStack {
        UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: {})
          .padding(24)
        
        UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", action: {})
          .padding(24)
      }
    }
  }
}
