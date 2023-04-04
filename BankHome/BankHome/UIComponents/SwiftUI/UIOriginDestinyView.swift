import SwiftUI

public struct UIOriginDestinyView: View {
  
  private var originIcon: String
  private var originText: String
  private var destinyIcon: String
  private var destinyText: String
  
  public init(originIcon: String,
              originText: String,
              destinyIcon: String,
              destinyText: String) {
    self.originIcon = originIcon
    self.originText = originText
    self.destinyIcon = destinyIcon
    self.destinyText = destinyText
  }
  
  public var body: some View {
    VStack(spacing: 16) {
      origingView
      destinyView
    }
  }
}

struct UIOriginDestinyView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SwiftUI.Color(UIColor.dark100)
      UIOriginDestinyView(originIcon: "ic_flag_br", originText: "Real", destinyIcon: "ic_flag_uk", destinyText: "Libra esterlina")
        .padding(24)
    }
  }
}

extension UIOriginDestinyView {
  private var origingView: some View {
    HStack(spacing: 0) {
      ZStack {
        SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_arrow_left_new"))
          .frame(width: 24, height: 24, alignment: .center)
          .foregroundColor(SwiftUI.Color(UIColor.feedbackSystemAlert))
      }
      .frame(width: 64, height: 80)
      .background(SwiftUI.Color(UIColor.feedbackSystemAlert).opacity(0.3))
      
      VStack(alignment: .leading) {
        Text("Origem da conversão")
          .font(SwiftUI.Font(UIFont.body1))
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
          .frame(maxWidth: .infinity, alignment: .leading)
        
        HStack {
          SwiftUI.Image(uiImage: UIImage.getImage(name: originIcon))
            .frame(width: 24, height: 24, alignment: .leading)
          
          Text(originText)
            .font(SwiftUI.Font(UIFont.subtitle))
            .foregroundColor(SwiftUI.Color(UIColor.dark500))
        }
      }
      .padding(16)
    }
    .frame(height: 80)
    .background(.white)
    .cornerRadius(8)
  }
  
  private var destinyView: some View {
      HStack(spacing: 0) {
        ZStack {
          SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_arrow_right_new"))
            .frame(width: 24, height: 24, alignment: .center)
            .foregroundColor(SwiftUI.Color(UIColor.secondary500))
        }
        .frame(width: 64, height: 80)
        .background(SwiftUI.Color(UIColor.secondary500).opacity(0.3))
        
        VStack(alignment: .leading) {
          Text("Destino")
            .font(SwiftUI.Font(UIFont.body1))
            .foregroundColor(SwiftUI.Color(UIColor.dark500))
            .frame(maxWidth: .infinity, alignment: .leading)
          
          HStack {
            SwiftUI.Image(uiImage: UIImage.getImage(name: destinyIcon))
              .frame(width: 24, height: 24, alignment: .leading)
            
            Text(destinyText)
              .font(SwiftUI.Font(UIFont.subtitle))
              .foregroundColor(SwiftUI.Color(UIColor.dark500))
          }
        }
        .padding(16)
      }
      .frame(height: 80)
      .background(.white)
      .cornerRadius(8)
    }
}
