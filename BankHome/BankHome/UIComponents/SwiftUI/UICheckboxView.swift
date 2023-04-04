import SwiftUI

public struct UICheckBoxView: View {
  @State private var isOn: Bool
  private var textLabel: String
  private var action: () -> Void
  
  public init(isOn: Bool, textLabel: String, action: @escaping () -> Void) {
    _isOn = State(initialValue: isOn)
    self.textLabel = textLabel
    self.action = action
  }
  
  public var body: some View {
    HStack {
      Image(uiImage: isOn ? UIImage.getImage(name: "ic_checkbox_on") : UIImage.getImage(name: "ic_checkbox_off"))
        .foregroundColor(SwiftUI.Color(UIColor.primary500))
      
      Text(textLabel)
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark400))
        .padding(.leading, 16)
      
      Spacer() 
    }
    .onTapGesture {
      isOn.toggle()
      action()
    }
  }
}

struct UICheckBoxView_Previews: PreviewProvider {
  static var previews: some View {
    UICheckBoxView(isOn: true, textLabel: "check box text check box text check box text check box text", action: {})
  }
}

