import SwiftUI

public enum UIDisclaimerViewStyle {
  case `default`
  case green
  
  var backgroundColor: Color {
    switch self {
    case .green:
      return SwiftUI.Color(UIColor.secondary500).opacity(0.1)
    default:
      return SwiftUI.Color(UIColor.dark200)
    }
  }
}

public struct UIDisclaimerView: View {
  private var text: String
  private var style: UIDisclaimerViewStyle
  private var clickAction: (() -> Void)?
  
  public init(text: String,
              style: UIDisclaimerViewStyle = .default,
              clickAction: (() -> Void)? = nil) {
    self.text = text
    self.style = style
    self.clickAction = clickAction
  }
  
  public var body: some View {
    HStack(spacing: 0) {
      ZStack {
        SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_notification"))
          .frame(width: 24, height: 24, alignment: .center)
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
      }
      .padding(.horizontal, 16)
      
      Text(.init(text))
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
      
      Spacer()
    }
    .padding(.vertical, 24)
    .background(style.backgroundColor)
    .cornerRadius(8)
    .onTapGesture {
      if let clickAction {
        clickAction()
      }
    }
  }
}

struct UIDisclaimerView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SwiftUI.Color(UIColor.dark100)
      UIDisclaimerView(text: "Você tem desconto especial! Aproveite! Você tem desconto especial! Aproveite!", style: .green)
        .padding(24)
      
      SwiftUI.Color(UIColor.dark100)
      UIDisclaimerView(text: "O valor inserido excede o seu limite. Para solicitar uma análise de aumento de limite envie seu último IR mais comprovante para o e-mail", clickAction: { print("clicked") })
        .padding(24)

      SwiftUI.Color(UIColor.dark100)
      UIDisclaimerView(text: "Você tem desconto especial!\n Aproveite!")
        .padding(24)
    }
    .fixedSize(horizontal: false, vertical: true)
  }
}
