import SwiftUI

public enum UIInputTextFieldType {
  case normal
  case email
  case search
  
  var icon: String? {
    switch self {
    case .search:
      return "ic_search"
    default:
      return nil
    }
  }
}

public struct UIInputTextField: View {
  @Binding private var text: String
  private var placeholder: String
  private var inputType: UIInputTextFieldType
  private var type: UIKeyboardType = .default
  private var onChange: () -> Void
  private var onClicked: () -> Void
  
  @FocusState private var isFocused: Bool
  
  public init(text: Binding<String>,
              placeholder: String,
              inputType: UIInputTextFieldType = .normal,
              onChange: @escaping () -> Void = {},
              onClicked: @escaping () -> Void = {}) {
    _text = text
    self.placeholder = placeholder
    self.inputType = inputType
    self.onChange = onChange
    self.onClicked = onClicked
    
    switch inputType {
    case .email:
      type = .emailAddress
    default:
      break
    }
  }
  
  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .stroke(isFocused ? SwiftUI.Color(UIColor.primary500) : SwiftUI.Color(UIColor.dark300), lineWidth: 1)
      HStack(spacing: 0) {
        ZStack {
          if text.isEmpty {
            Text(placeholder)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.horizontal, 12)
              .font(SwiftUI.Font(UIFont.caption))
              .foregroundColor(SwiftUI.Color(UIColor.dark300))
          }
          
          TextField("", text: $text)
            .keyboardType(type)
            .font(SwiftUI.Font(UIFont.body2))
            .focused($isFocused)
            .foregroundColor(SwiftUI.Color(UIColor.dark500))
            .padding(8)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onChange(of: text, perform: { newValue in
              self.onChange()
            })
          
          if !text.isEmpty {
            ZStack(alignment: .leading) {
              Text(" " + placeholder + " ")
                .font(SwiftUI.Font(UIFont.body2))
                .foregroundColor(SwiftUI.Color(UIColor.dark400))
                .background(SwiftUI.Color(UIColor.dark100))
                .padding(.horizontal, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(y: -22)
          }
        }
        
        if inputType == .search {
          SwiftUI.Image(uiImage: UIImage.getImage(name: inputType.icon ?? ""))
            .foregroundColor(SwiftUI.Color(UIColor.primary500))
            .frame(width: 24, height: 24, alignment: .leading)
            .padding(8)
        }
      }
    }
    .frame(height: 43)
    .onTapGesture {
      self.onClicked()
    }
  }
}

struct UIInputTextField_Previews: PreviewProvider {
  @State static var emailText: String = ""
  
  static var previews: some View {
    VStack {
      UIInputTextField(text: $emailText, placeholder: "E-mail ou CPF", inputType: .email)
      
      UIInputTextField(text: $emailText, placeholder: "Pesquise", inputType: .search)
    }
  }
}
