import SwiftUI

struct UIHomeServicesTabView: View {
  @ObservedObject var viewModel: UIHomeServicesTabViewModel
  @EnvironmentObject var coordinator: Coordinator<DefaultRouter>
  
  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        headerView
        
        ScrollView {
          VStack {
            LazyVGrid(columns: columns, spacing: 8) {
              ForEach(viewModel.cards, id: \.self) { item in
                UIShortcutButtonView(iconImage: item.icon, text: item.text, action: {})
                  .frame(height: 96)
              }
            }
            .padding(.horizontal, 16)
          }
          .padding(.top, 24)
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
        }
        .background(SwiftUI.Color(UIColor.dark100))
      }
      .onAppear {
        viewModel.setCardsServices()
      }
    }
  }
}

struct UIHomeSecondTabView_Previews: PreviewProvider {
  static var previews: some View {
    UIHomeServicesTabView(viewModel: UIHomeServicesTabViewModel())
  }
}

extension UIHomeServicesTabView {
  private var headerView: some View {
    ZStack {
      Text("Serviços")
        .font(SwiftUI.Font(UIFont.subtitle))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
    }
    .frame(height: 56)
    .background(.white)
  }
}
