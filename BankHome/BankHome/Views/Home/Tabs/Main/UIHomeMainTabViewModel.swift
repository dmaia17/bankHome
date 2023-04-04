import Foundation

class UIHomeMainTabViewModel: ObservableObject {
  @Published var notificationHomeButtonClick = false
  @Published var eyeHomeButtonClick = false
  @Published var profileHomeButtonClick = false
  
  @Published var simulationButtonText: String = "Continuar simulação"
  @Published var enableSimulationButton: Bool = true
  
  func simulationButtonClicked(coordinator: Coordinator<DefaultRouter>) {

  }

  func notificationsNavButtonClicked(coordinator: Coordinator<DefaultRouter>) {

  }

  func profileNavButtonClicked(coordinator: Coordinator<DefaultRouter>) {

  }
}

struct HomeCardViewModel: Identifiable {
  var id: Int = 0
  var value: String = ""
  var coin: String = ""
  var symbol: String = ""
  var show: Bool = false
}
