import Foundation

class CatInfoViewModel: ObservableObject {
    @Published var catInfo = CatInfoModel(catName: "", catAge: "", hasHealthIssues: false, healthDetails: "")
    
    func submitCatInfo() {
        // Logic to save or process cat info
        print("Cat Information Submitted: \(catInfo)")
    }
}
