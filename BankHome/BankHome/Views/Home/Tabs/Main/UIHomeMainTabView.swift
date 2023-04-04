import SwiftUI

struct UIHomeMainTabView: View {
  @ObservedObject var viewModel: UIHomeMainTabViewModel
  @EnvironmentObject var coordinator: Coordinator<DefaultRouter>
  
  @State private var x: CGFloat = 0
  @State private var count: CGFloat = 0
  @State private var screen = UIScreen.main.bounds.width - 60
  @State private var op: CGFloat = 348
  
  @State private var firstCardValue: String = ""
  @State private var secondCardValue: String = ""
  @State private var firstCardIsErrorMode: Bool = false
  @State private var secondCardIsErrorMode: Bool = false
  
  @State var data = [
    HomeCardViewModel(id: 0, value: "249.50", coin: "Dolar", symbol: "USD", show: true),
    HomeCardViewModel(id: 1, value: "22.40", coin: "Euro", symbol: "EUR"),
    HomeCardViewModel(id: 2, value: "1540.00", coin: "Real", symbol: "BRL")
  ]
  
  var body : some View {
    UIHomeNavigationBar(notificationHomeButtonClickAction: {},
                        eyeHomeButtonClickAction: {},
                        profileHomeButtonClickAction: {}) {
      ScrollView(.vertical) {
        VStack {
          balanceView
          itemCard
          conversionView
        }
        .background(SwiftUI.Color(UIColor.primary500))

        if viewModel.eyeHomeButtonClick {
          configureModal
        }
      }
      .background(VStack(spacing: .zero) { SwiftUI.Color(UIColor.primary500); SwiftUI.Color(UIColor.dark100) })
      .onTapGesture {
        self.endTextEditing()
      }
    }
    .animation(.spring())
    .onAppear {
      self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
    }
  }
}

struct UIHomeMainTabView_Previews: PreviewProvider {
  static var previews: some View {
    UIHomeMainTabView(viewModel: UIHomeMainTabViewModel())
  }
}

extension UIHomeMainTabView {
  private var balanceView: some View {
    HStack {
      Text("Saldo")
        .font(SwiftUI.Font(UIFont.subtitle))
        .foregroundColor(.white)

      Spacer()

      Text("R$ 12.525,03")
        .font(SwiftUI.Font(UIFont.subtitle))
        .foregroundColor(.white)

      SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_flag_br"))
        .frame(width: 24, height: 24)
    }
    .padding(.top, 16)
    .padding(.horizontal, 24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  private var itemCard: some View {
    VStack {
      HStack(spacing: 15) {
        ForEach(data){ i in
          UIAccountCardView(data: i, extractButtonClickAction: { print("Go to extract") })
            .offset(x: self.x)
            .highPriorityGesture(DragGesture()
              .onChanged({ (value) in
                if value.translation.width > 0 {
                  self.x = value.location.x
                }else{
                  self.x = value.location.x - self.screen
                }
              })
                .onEnded({ (value) in
                  if value.translation.width > 0 {
                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0 {
                      self.count -= 1
                      self.updateHeight(value: Int(self.count))
                      self.x = -((self.screen + 15) * self.count)
                    } else {
                      self.x = -((self.screen + 15) * self.count)
                    }
                  } else {
                    if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1) {
                      self.count += 1
                      self.updateHeight(value: Int(self.count))
                      self.x = -((self.screen + 15) * self.count)
                    } else {
                      self.x = -((self.screen + 15) * self.count)
                    }
                  }
                })
            )
        }
      }.frame(width: UIScreen.main.bounds.width)
        .offset(x: self.op)
        .padding(.top, 16)

      HStack {
        ForEach(data) { i in
          if i.show {
            Circle()
              .fill(SwiftUI.Color(UIColor.white))
              .frame(width: 8, height: 8)
          } else {
            Circle()
              .fill(SwiftUI.Color(UIColor.white).opacity(0.5))
              .frame(width: 8, height: 8)
          }
        }
      }
      .padding(.top, 24)
    }
    .padding(.bottom, 24)
    .background(LinearGradient(gradient: Gradient(colors: [SwiftUI.Color(UIColor.primary500),
                                                           SwiftUI.Color(UIColor.primary500)]),
                               startPoint: .top, endPoint: .bottom))
  }

  private func updateHeight(value : Int){
    for i in 0..<data.count {
      data[i].show = false
    }

    data[value].show = true
  }

  private var conversionView: some View {
    VStack(spacing: 0) {
      Text("Simulação rápida")
        .font(SwiftUI.Font(UIFont.subtitle))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)

      Divider()
        .background(SwiftUI.Color(UIColor.dark300))
        .frame(height: 0.5)
        .padding(.bottom, 16)

      ZStack(alignment: .bottomTrailing) {
        VStack(spacing: 0) {
          originConversionView
          destinyConversionView
        }

        SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_arrow_up_down"))
          .frame(width: 24, height: 24)
          .foregroundColor(SwiftUI.Color(UIColor.white))
          .padding(8)
          .background(SwiftUI.Color(UIColor.dark500))
          .clipShape(Circle())
          .offset(x: -16, y: -80)
          .onTapGesture {
            print("Conversion button clicked")
          }
      }

      UISolidButton(text: viewModel.simulationButtonText,
                    enabled: $viewModel.enableSimulationButton,
                    action: {
        self.endTextEditing()
        viewModel.simulationButtonClicked(coordinator: coordinator)
      })
      .frame(width: 200)
      .padding(.top, 24)
      .padding(.bottom, 36)
    }
    .padding(.horizontal, 24)
    .background(SwiftUI.Color(UIColor.dark100))
    .cornerRadius(16, corners: [.topLeft, .topRight])
  }

  private var originConversionView: some View {
    VStack {
      Text("Origem")
        .font(SwiftUI.Font(UIFont.caption))
        .frame(maxWidth: .infinity, alignment: .leading)

      UICardConversionView(text: $firstCardValue,
                           leadingIcon: "ic_flag_br",
                           leadingText: "BRL",
                           placeholder: "Valor a debitar",
                           errorText: "Valor mínimo para conversão 52,43 BRL",
                           isErrorMode: $firstCardIsErrorMode,
                           leadingViewClickAction: { print("leadingViewClickAction") },
                           onTextChange: { firstCardValue = firstCardValue.currencyInputFormattingWithoutSymbol() ?? "0,00" })

      Text("Saldo atual: 1.234,56 USD")
        .font(SwiftUI.Font(UIFont.subtitle))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
        .padding(.bottom, 16)
    }
    .padding(.horizontal, 16)
    .padding(.top, 16)
    .background(SwiftUI.Color(UIColor.white))
    .cornerRadius(8, corners: [.topLeft, .topRight])
  }

  private var destinyConversionView: some View {
    VStack {
      Text("Destino")
        .font(SwiftUI.Font(UIFont.caption))
        .frame(maxWidth: .infinity, alignment: .leading)

      UICardConversionView(text: $secondCardValue,
                           leadingIcon: "ic_flag_eua",
                           leadingText: "BRL",
                           placeholder: "Valor a debitar",
                           errorText: "Valor mínimo para conversão 52,43 BRL",
                           isErrorMode: $secondCardIsErrorMode,
                           leadingViewClickAction: { print("leadingViewClickAction") },
                           onTextChange: { secondCardValue = secondCardValue.currencyInputFormattingWithoutSymbol() ?? "0,00" })
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(SwiftUI.Color(UIColor.whiteHot2))
    .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
  }

  var configureModal: some View {
    UIModalDialogView(iconImage: "ic_alert",
                      titleText: "Atenção!",
                      descriptionText: "Você sairá do app e abrirá o site do nosso parceiro para acompanhar a entrega do seu cartão. \n\n Deseja realmente sair do app?",
                      buttonSuccessText: "Sim, continuar",
                      buttonCancelText: "Fechar",
                      successCallback: { viewModel.eyeHomeButtonClick.toggle() },
                      cancelCallback: { viewModel.eyeHomeButtonClick.toggle() })
  }

  private func notificationHomeUpdated() {
    viewModel.notificationsNavButtonClicked(coordinator: coordinator)
  }

  private func profileHomeUpdated() {
    viewModel.profileNavButtonClicked(coordinator: coordinator)
  }
}
