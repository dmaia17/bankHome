import Foundation

class UIHomeViewModel: ObservableObject {
  
  @Published var selectedTab = 0
  @Published var isLoading = true
  
  let numTabs = 3
  let minDragTranslationForSwipe: CGFloat = 50
  
  func handleSwipe(translation: CGFloat) {
    if translation > minDragTranslationForSwipe && selectedTab > 0 {
      selectedTab -= 1
    } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs - 1 {
      selectedTab += 1
    }
  }
}
