import SwiftUI

public struct UIBottomSheetView<Content: View>: View {
  @Binding private var isShowing: Bool
  private let content: Content
  
  public init(isShowing: Binding<Bool>, @ViewBuilder content: () -> Content) {
    _isShowing = isShowing
    self.content = content()
  }
  
  public var body: some View {
    ZStack(alignment: .bottom) {
      if (isShowing) {
        Color.black
          .opacity(0.3)
          .ignoresSafeArea()
          .onTapGesture {
            isShowing.toggle()
          }
        
        content
          .padding(.bottom, 42)
          .transition(.move(edge: .bottom))
          .background(
            Color(uiColor: .white)
          )
          .cornerRadius(16, corners: [.topLeft, .topRight])
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea()
    .animation(.easeInOut, value: isShowing)
  }
}

struct UIBottomSheetView_Previews: PreviewProvider {
  static var previews: some View {
    UIBottomSheetView(isShowing: .constant(true), content: {
      ZStack {
        Color.red
      }
      .frame(width: .infinity, height: 300)
    })
  }
}
