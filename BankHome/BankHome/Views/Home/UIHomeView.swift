import SwiftUI

struct UIHomeView: View {
  @ObservedObject var viewModel: UIHomeViewModel
  @State private var tabSelection: UITabBarHomeItemModel = .home
  @EnvironmentObject var coordinator: Coordinator<DefaultRouter>
  
  var body: some View {
    ZStack {
      ZStack {
        UITabBarHomeContainerView(selection: $tabSelection) {
          UIHomeMainTabView(viewModel: UIHomeMainTabViewModel())
            .tabBarItem(tab: .home, selection: $tabSelection)
          
          UIHomeServicesTabView(viewModel: UIHomeServicesTabViewModel())
            .tabBarItem(tab: .service, selection: $tabSelection)
          
          UIHomeDebitCardTabView(viewModel: UIHomeDebitCardTabViewModel())
            .tabBarItem(tab: .card, selection: $tabSelection)
          
          UIHomeHelpTabView(viewModel: UIHomeHelpTabViewModel())
            .tabBarItem(tab: .doubt, selection: $tabSelection)
        }
      }
      .background(SwiftUI.Color(UIColor.dark100))
    }
  }
}

extension UIHomeView {
  
}

struct UIHomeView_Previews: PreviewProvider {
  static let tabs: [UITabBarHomeItemModel] = [.home, .service, .card, .doubt]
  
  static var previews: some View {
    UIHomeView(viewModel: UIHomeViewModel())
  }
}
