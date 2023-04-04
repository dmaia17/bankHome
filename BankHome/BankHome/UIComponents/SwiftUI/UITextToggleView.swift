import SwiftUI

public struct UITextToggleView: View {
  @State private var isOn: Bool
  private var textLabel: String
  private var action: () -> Void
  
  public init(isOn: Bool, textLabel: String, action: @escaping () -> Void) {
    _isOn = State(initialValue: isOn)
    self.textLabel = textLabel
    self.action = action
  }
  
  public var body: some View {
    Toggle(isOn: $isOn) {
      Text(textLabel)
        .font(SwiftUI.Font(UIFont.body1))
        .foregroundColor(SwiftUI.Color(UIColor.dark400))
    }.onChange(of: isOn) { _isOn in
      action()
    }
  }
}

struct UITextToggleView_Previews: PreviewProvider {
  static var previews: some View {
    UITextToggleView(isOn: true, textLabel: "Texto toggle", action: {})
  }
}
