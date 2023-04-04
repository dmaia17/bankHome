import SwiftUI

public struct UIRelationshipCenterReceiptView: View {
  
  public init() {}
  
  public var body: some View {
    VStack(spacing: 0) {
      Text("Central de Relacionamento")
        .font(SwiftUI.Font(UIFont.labelCategory))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .center)
      
      Text("Capitais e regiões metropolitanas:")
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 8)
      
      Text("3003 5202")
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .center)
      
      Text("Demais localidades:")
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 8)
      
      Text("0800 545 5200")
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .frame(maxWidth: .infinity, alignment: .center)
    }
  }
}

struct UIRelationshipCenterReceiptView_Previews: PreviewProvider {
  static var previews: some View {
    UIRelationshipCenterReceiptView()
  }
}
