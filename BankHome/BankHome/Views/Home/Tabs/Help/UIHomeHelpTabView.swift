import SwiftUI

struct UIHomeHelpTabView: View {
  @ObservedObject var viewModel: UIHomeHelpTabViewModel
  @EnvironmentObject var coordinator: Coordinator<DefaultRouter>
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        headerView
        
        ScrollView(.vertical) {
          VStack {
            headerInfoView
            chatView
            socialMediaView
            emailView
            relationshipView
            customerPortalView
            ombudsmanView
            bacenView
          }
          .padding(24)
          .frame(minWidth: geo.size.width, minHeight: geo.size.height)
        }
        .background(SwiftUI.Color(UIColor.dark100))
      }
    }
  }
}

struct UIHomeHelpTabView_Previews: PreviewProvider {
  static var previews: some View {
    UIHomeHelpTabView(viewModel: UIHomeHelpTabViewModel())
  }
}

extension UIHomeHelpTabView {
  private var headerView: some View {
    VStack(spacing: 16) {
      ZStack {
        Text("Ajuda")
          .font(SwiftUI.Font(UIFont.subtitle))
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 24)
      }
      .frame(height: 56)
      .background(.white)
    }
  }
  
  private var headerInfoView: some View {
    VStack(spacing: 8) {
      Text("Precisa de ajuda?")
        .font(SwiftUI.Font(UIFont.title2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .leading)

      Text("Entre em contato com a gente:")
        .font(SwiftUI.Font(UIFont.body1))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
  
  private var chatView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
  
  private var socialMediaView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_like", title: "Redes sociais", description: "Conta pra gente a sua dúvida.")
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          UIShortcutButtonView(iconImage: "ic_instagram", text: "Instagram", action: { print("ic_instagram") })
            .frame(width: 120)
          
          UIShortcutButtonView(iconImage: "ic_facebook", text: "Facebook", action: { print("ic_facebook") })
            .frame(width: 120)
          
          UIShortcutButtonView(iconImage: "ic_twitter", text: "Twitter", action: { print("ic_twitter") })
            .frame(width: 120)
          
          UIShortcutButtonView(iconImage: "ic_youtube", text: "Youtube", action: { print("ic_youtube") })
            .frame(width: 120)
        }
        .padding(.top, 16)
        .frame(height: 120)
      }
    }
  }
  
  private var emailView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
  
  private var relationshipView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
  
  private var customerPortalView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
  
  private var ombudsmanView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
  
  private var bacenView: some View {
    VStack(spacing: 0) {
      UIHomeHelpTabTitleItemView(icon: "ic_chat", title: "Chat", description: "Conta pra gente a sua dúvida.")
      
      UIShortcutSubtitleIconView(title: "Como podemos te ajudar?", description: "Iniciar conversa", action: { print("Como podemos te ajudar?")})
        .padding(.top, 8)
    }
  }
}

private struct UIHomeHelpTabTitleItemView: View {
  var icon: String
  var title: String
  var description: String
  
  var body: some View {
    VStack(spacing: 8) {
      HStack {
        SwiftUI.Image(uiImage: UIImage.getImage(name: icon))
          .frame(width: 24, height: 24, alignment: .leading)
        
        Text(title)
          .font(SwiftUI.Font(UIFont.labelCategory))
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(description)
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.top, 24)
  }
}
