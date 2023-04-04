//
//  UICardConversionView.swift
//  BS2UIKit
//
//  Created by Daniel Maia dos Passos on 12/01/23.
//  Copyright © 2023 BS2. All rights reserved.
//

import SwiftUI

public struct UICardConversionView: View {
  @Binding private var text: String
  @Binding var isErrorMode: Bool
  
  private var leadingIcon: String
  private var leadingText: String
  private var placeholder: String
  private var errorText: String
  private var leadingViewClickAction: () -> Void
  private var onTextChange: () -> Void
  
  private var placeholderTextFieldOfSet: CGFloat = 0
  private var textValueTextFieldOfSet: CGFloat = 0
  
  public init(text: Binding<String>,
              leadingIcon: String,
              leadingText: String,
              placeholder: String,
              errorText: String,
              isErrorMode: Binding<Bool>,
              leadingViewClickAction: @escaping () -> Void,
              onTextChange: @escaping () -> Void) {
    _text = text
    _isErrorMode = isErrorMode
    
    self.leadingIcon = leadingIcon
    self.leadingText = leadingText
    self.placeholder = placeholder
    self.leadingViewClickAction = leadingViewClickAction
    self.onTextChange = onTextChange
    self.errorText = errorText
  }
  
  public var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 4)
          .stroke(isErrorMode ? SwiftUI.Color(UIColor.feedbackSystemAlert) : SwiftUI.Color(UIColor.dark400), lineWidth: 0.5)
          .background(RoundedRectangle(cornerRadius: 4).fill(SwiftUI.Color(UIColor.white)))

        HStack {
          leadingViewWithFlag
          traillingTextFieldView
        }
      }
      .frame(height: 48)
      
      if isErrorMode {
        Text(errorText)
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
          .padding(.top, 8)
          .font(SwiftUI.Font(UIFont.caption))
          .foregroundColor(SwiftUI.Color(UIColor.feedbackSystemAlert))
      }
    }
  }
}

struct UICardConversionView_Previews: PreviewProvider {
  @State static var text: String = ""
  @State static var isErrorMode: Bool = true
  
  static var previews: some View {
    VStack {
      UICardConversionView(text: $text,
                           leadingIcon: "ic_flag_br",
                           leadingText: "BRL",
                           placeholder: "Valor a debitar",
                           errorText: "Valor mínimo para conversão 52,43 BRL",
                           isErrorMode: $isErrorMode,
                           leadingViewClickAction: {},
                           onTextChange: {})
      
      UICardConversionView(text: $text,
                           leadingIcon: "",
                           leadingText: "Selecione",
                           placeholder: "Valor a debitar",
                           errorText: "Valor mínimo para conversão 52,43 BRL",
                           isErrorMode: $isErrorMode,
                           leadingViewClickAction: {},
                           onTextChange: {})
    }
    .padding(24)
    .background(SwiftUI.Color(UIColor.whiteHot2))
  }
}

extension UICardConversionView {
  var leadingViewWithFlag: some View {
    Button {
      leadingViewClickAction()
    } label: {
      HStack {
        if !leadingIcon.isEmpty {
          SwiftUI.Image(uiImage: UIImage.getImage(name: leadingIcon))
            .frame(width: 24, height: 24)
            .frame(alignment: .leading)
            .padding(.leading, 8)
            .foregroundColor(SwiftUI.Color(UIColor.primary500))
        }
        
        Text(leadingText)
          .font(SwiftUI.Font(UIFont.subtitle))
          .foregroundColor(SwiftUI.Color(UIColor.dark500))
          .padding(.horizontal, 8)
          .frame(maxWidth: .infinity, alignment: .leading)

        SwiftUI.Image(uiImage: UIImage.getImage(name: "ic_chevron_down"))
          .resizable()
          .frame(width: 10, height: 6)
          .foregroundColor(SwiftUI.Color(UIColor.dark500))

        Divider()
          .frame(width: 0.5)
          .background(SwiftUI.Color(UIColor.dark400))
          .padding(.vertical, 3)
      }
    }
    .frame(width: 140)
  }
  
  var traillingTextFieldView: some View {
    ZStack {
      Text(placeholder)
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark400))
        .frame(maxWidth: .infinity, alignment: .leading)
        .offset(y: text.isEmpty ? 0.0 : -10.0)
      
      TextField("", text: $text)
        .keyboardType(.numberPad)
        .font(SwiftUI.Font(UIFont.body2))
        .foregroundColor(SwiftUI.Color(UIColor.dark500))
        .offset(y: text.isEmpty ? 0.0 : 10.0)
        .onChange(of: text, perform: { newValue in
          self.onTextChange()
        })
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
