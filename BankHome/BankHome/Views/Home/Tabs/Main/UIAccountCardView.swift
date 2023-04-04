import SwiftUI

struct UIAccountCardView: View {
  private var data: HomeCardViewModel
  private var extractButtonClickAction: () -> Void
  @State private var showBalance: Bool = false
  
  public init(data: HomeCardViewModel,
              extractButtonClickAction: @escaping () -> Void) {
    self.data = data
    self.extractButtonClickAction = extractButtonClickAction
  }
  
  var body: some View {
    VStack(spacing: 0) {
      cardHeadView
      cardValueView
      
      UIOutlineButton(text: "Ver Extrato", action: { extractButtonClickAction() })
        .padding(.top, 16)
        .frame(width: 120)
      
      Spacer()
    }
    .frame(width: UIScreen.main.bounds.width - 60, height: data.show ? 170 : 150)
    .background(SwiftUI.Color(UIColor.dark100))
    .cornerRadius(8)
  }
}

struct UIAccountCardView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      UIAccountCardView(data: HomeCardViewModel(value: "249.50", coin: "Dolar", symbol: "USD", show: true), extractButtonClickAction: {})
    }
  }
}

extension UIAccountCardView {
  private var cardHeadView: some View {
    HStack {
      SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_flag_br"))
        .frame(width: 24, height: 24)
      
      Text("Real")
        .font(SwiftUI.Font(UIFont.labelCategory))
        .padding(.leading, 8)
      
      Spacer()
      
      Button {
        showBalance.toggle()
      } label: {
        SwiftUI.Image(uiImage: UIImage.getImage(name: showBalance ? "ic_eye_hide" : "ic_eye_show"))
          .frame(width: 24, height: 24)
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
      }
    }
    .padding(.top, 24)
    .padding(.horizontal, 24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var cardValueView: some View {
    HStack {
      Text(showBalance ? "2504,32" : "••••")
        .font(SwiftUI.Font(UIFont.medium))
      
      Text("BRL")
        .font(SwiftUI.Font(UIFont.body1))
        .padding(.leading, 8)
    }
    .padding(.top, 8)
    .padding(.horizontal, 24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
