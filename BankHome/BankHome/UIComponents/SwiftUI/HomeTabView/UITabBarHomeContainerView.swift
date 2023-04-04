import SwiftUI

public struct UITabBarHomeContainerView<Content: View>: View {
  @Binding var selection: UITabBarHomeItemModel
  let content: Content
  @State private var tabs: [UITabBarHomeItemModel] = []
  
  public init(selection: Binding<UITabBarHomeItemModel>, @ViewBuilder content: () -> Content) {
    _selection = selection
    self.content = content()
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      ZStack {
        content
      }
      UIHomeTabBarView(tabs: tabs, selection: $selection)
    }
    .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
      tabs = value
    })
  }
}

struct TabBarItemsPreferenceKey: PreferenceKey {
  static var defaultValue: [UITabBarHomeItemModel] = []
  
  static func reduce(value: inout [UITabBarHomeItemModel], nextValue: () -> [UITabBarHomeItemModel]) {
    value += nextValue()
  }
}

struct TabBarItemModifier: ViewModifier {
  let tab: UITabBarHomeItemModel
  @Binding var selection: UITabBarHomeItemModel
  
  func body(content: Content) -> some View {
    content
      .opacity(selection == tab ? 1.0 : 0.0)
      .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
  }
}

extension View {
  public func tabBarItem(tab: UITabBarHomeItemModel, selection: Binding<UITabBarHomeItemModel>) -> some View {
    modifier(TabBarItemModifier(tab: tab, selection: selection))
  }
}
