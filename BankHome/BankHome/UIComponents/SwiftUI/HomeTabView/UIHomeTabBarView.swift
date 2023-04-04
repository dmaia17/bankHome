import SwiftUI

public struct UIHomeTabBarView: View {

  private let tabs: [UITabBarHomeItemModel]
  @Binding private var selection: UITabBarHomeItemModel

  public init(tabs: [UITabBarHomeItemModel], selection: Binding<UITabBarHomeItemModel>) {
    self.tabs = tabs
    _selection = selection
  }
  
  public var body: some View {
    VStack {
      Divider()
        .background(SwiftUI.Color(UIColor.dark300))
        .frame(height: 1)
      
      HStack {
        ForEach(tabs, id: \.self) { tab in
          tabView(tab: tab)
            .onTapGesture {
              switchToTab(tab: tab)
            }
        }
      }
    }
    .background(SwiftUI.Color(UIColor.white).ignoresSafeArea(edges: .bottom))
  }
}

struct UIHomeTabBarView_Previews: PreviewProvider {
  static let tabs: [UITabBarHomeItemModel] = [.home, .service, .card, .doubt]

  static var previews: some View {
    ZStack {
      UIHomeTabBarView.init(tabs: tabs, selection: .constant(tabs.first!))
    }
  }
}

extension UIHomeTabBarView {
  private func tabView(tab: UITabBarHomeItemModel) -> some View {
    VStack {
      Image(uiImage: UIImage.getImage(name: tab.icon))

      Text(tab.text)
        .font(SwiftUI.Font(UIFont.caption))
    }
    .foregroundColor(selection == tab ? SwiftUI.Color(UIColor.dark500) : SwiftUI.Color(UIColor.dark400))
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
    .background(SwiftUI.Color(UIColor.white))
  }
  
  private func switchToTab(tab: UITabBarHomeItemModel) {
    withAnimation(.easeInOut) {
      selection = tab
    }
  }
}
