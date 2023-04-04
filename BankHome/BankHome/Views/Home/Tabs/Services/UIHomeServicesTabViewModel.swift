import Foundation

class UIHomeServicesTabViewModel: ObservableObject {
  @Published var cards: [BSAccountMenuConfigurationModel] = []
  
  func setCardsServices() {
    cards = []
  }
}

struct BSAccountMenuConfigurationModel: Decodable, Hashable {
  var id: String = ""
  var text: String = ""
  var icon: String = ""
}
