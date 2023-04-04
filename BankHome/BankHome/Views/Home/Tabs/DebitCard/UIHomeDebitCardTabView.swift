import SwiftUI

struct UIHomeDebitCardTabView: View {
  @ObservedObject var viewModel: UIHomeDebitCardTabViewModel
  @EnvironmentObject var coordinator: Coordinator<DefaultRouter>
  
  var body: some View {
    ZStack {
      Text("TODO: Debit card")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(SwiftUI.Color(UIColor.blue))
    .clipped()
  }
}

struct UIHomeDebitCardTabView_Previews: PreviewProvider {
    static var previews: some View {
      UIHomeDebitCardTabView(viewModel: UIHomeDebitCardTabViewModel())
    }
}
