import Foundation

class WelcomeScreenViewModel: ObservableObject {
    @Published var model = WelcomeScreenModel(
        title: "KidZone",
        subtitle: "Discover fun activities and educational content for kids",
        buttonTitle: "Join",
        imageName: "kid_with_cat" // Add this image to your Assets folder
    )
}
