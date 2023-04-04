import SwiftUI

public struct UIHomeNavigationBar<Content: View>: View {
  
  private let content: Content
  private var notificationHomeButtonClickAction: () -> Void
  private var eyeHomeButtonClickAction: () -> Void
  private var profileHomeButtonClickAction: () -> Void
  
  public init(notificationHomeButtonClickAction: @escaping () -> Void,
              eyeHomeButtonClickAction: @escaping () -> Void,
              profileHomeButtonClickAction: @escaping () -> Void,
              @ViewBuilder content: () -> Content) {
    self.notificationHomeButtonClickAction = notificationHomeButtonClickAction
    self.eyeHomeButtonClickAction = eyeHomeButtonClickAction
    self.profileHomeButtonClickAction = profileHomeButtonClickAction
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
    UIHomeNavigationBar(notificationHomeButtonClickAction: {},
                        eyeHomeButtonClickAction: {},
                        profileHomeButtonClickAction: {},
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
        notificationHomeButtonClickAction()
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_notification"))
          .resizable()
      }
      .frame(width: 24, height: 24)
      .padding(.trailing, 10)
      
      Button(action: {
        withAnimation {
          eyeHomeButtonClickAction()
        }
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_eye_hide"))
          .resizable()
      }
      .frame(width: 24, height: 24)
      .padding(.trailing, 10)
      
      Button(action: {
        profileHomeButtonClickAction()
      }) {
        Image(uiImage: UIImage.getImage(name: "ic_profile"))
          .resizable()
      }
      .frame(width: 24, height: 24)
    }
  }
}
