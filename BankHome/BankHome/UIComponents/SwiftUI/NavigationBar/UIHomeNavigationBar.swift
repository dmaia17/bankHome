import SwiftUI

public struct UIHomeNavigationBar<Content: View>: View {
  
  private let content: Content
  @Binding private var notificationHomeButtonClick: Bool
  @Binding private var eyeHomeButtonClick: Bool
  @Binding private var profileHomeButtonClick: Bool
  
  public init(notificationHomeButtonClick: Binding<Bool>,
              eyeHomeButtonClick: Binding<Bool>,
              profileHomeButtonClick: Binding<Bool>,
              @ViewBuilder content: () -> Content) {
    _notificationHomeButtonClick = notificationHomeButtonClick
    _eyeHomeButtonClick = eyeHomeButtonClick
    _profileHomeButtonClick = profileHomeButtonClick
    self.content = content()
  }
  
  public var body: some View {
    NavigationView {
      ZStack {
        VStack(spacing: 0) {
          homeNavigation
          
          content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
      }
    }.navigationBarHidden(true)
  }
}

struct UIHomeNavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    UIHomeNavigationBar(notificationHomeButtonClick: .constant(false),
                        eyeHomeButtonClick: .constant(false),
                        profileHomeButtonClick: .constant(false),
                        content: {
      ZStack {
        Color.red
      }
    })
  }
}

extension UIHomeNavigationBar {
  private var homeNavigation: some View {
    VStack {
      HStack(spacing: 0) {
        Image(uiImage: UIImage.getImage(name: "logo_clear"))
          .resizable()
          .frame(width: 90, height: 24)
        
        Spacer()
        
        iconsSectionView
        
      }.frame(height: 56)
        .padding(.horizontal, 24)
        .foregroundColor(SwiftUI.Color(UIColor.white))
        .navigationBarHidden(true)
    }
    .background(SwiftUI.Color(UIColor.primary500))
  }
  
  private var iconsSectionView: some View {
    HStack {
      Button(action: {
        notificationHomeButtonClick.toggle()
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_notification"))
          .resizable()
      }
      .frame(width: 24, height: 24)
      .padding(.trailing, 10)
      
      Button(action: {
        withAnimation {
          eyeHomeButtonClick.toggle()
        }
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_eye_hide"))
          .resizable()
      }
      .frame(width: 24, height: 24)
      .padding(.trailing, 10)
      
      Button(action: {
        profileHomeButtonClick.toggle()
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_profile"))
          .resizable()
      }
      .frame(width: 24, height: 24)
    }
  }
}
