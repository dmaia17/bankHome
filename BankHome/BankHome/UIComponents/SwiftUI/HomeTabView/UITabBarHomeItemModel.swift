public enum UITabBarHomeItemModel: Hashable {
  case home, service, card, doubt
  
  var icon: String {
    switch self {
    case .home:
      return "ic_home"
    case .service:
      return "ic_service"
    case .card:
      return "ic_card"
    case .doubt:
      return "ic_doubt"
    }
  }
  
  var text: String {
    switch self {
    case .home:
      return "Início"
    case .service:
      return "Serviços"
    case .card:
      return "Debit Card"
    case .doubt:
      return "Ajuda"
    }
  }
}
