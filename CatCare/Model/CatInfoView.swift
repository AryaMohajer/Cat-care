import SwiftUI

struct CatInfoView: View {
    @StateObject private var viewModel = CatInfoViewModel()
    @State private var selectedAge: String = ""
    @State private var hasHealthIssues = false
    
    let ageOptions = ["Less than 1 year", "1-3 years", "4-7 years", "8-12 years", "13 years or older"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🐾 KidZone")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text("About You and Your Cat")
                .font(.title2)
                .fontWeight(.semibold)
            
            Form {
                Section(header: Text("What is your cat's name?").font(.headline)) {
                    TextField("Enter your cat's name", text: $viewModel.catInfo.catName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section(header: Text("How old is your cat?").font(.headline)) {
                    ForEach(ageOptions, id: \.self) { age in
                        HStack {
                            Text(age)
                            Spacer()
                            RadioButton(selected: $selectedAge, value: age)
                        }
                        .onTapGesture {
                            selectedAge = age
                            viewModel.catInfo.catAge = age
                        }
                    }
                }
                
                Section(header: Text("Does your cat have any known health issues or special needs?").font(.headline)) {
                    HStack {
                        Text("Yes")
                        Spacer()
                        RadioButton(selected: $hasHealthIssues, value: true)
                    }
                    .onTapGesture {
                        hasHealthIssues = true
                        viewModel.catInfo.hasHealthIssues = true
                    }
                    
                    HStack {
                        Text("No")
                        Spacer()
                        RadioButton(selected: $hasHealthIssues, value: false)
                    }
                    .onTapGesture {
                        hasHealthIssues = false
                        viewModel.catInfo.hasHealthIssues = false
                    }
                    
                    if hasHealthIssues {
                        TextField("If yes, please specify:", text: $viewModel.catInfo.healthDetails)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
            }
            
            Button(action: {
                viewModel.submitCatInfo()
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                // Skip functionality
                print("Ask Me Later pressed.")
            }) {
                Text("Ask me later")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            
            Text("Thank you for your time! We’ll use this information to tailor the app experience and provide better answers and features for you and your furry friend. 🐾")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding()
        }
        .padding()
    }
}

struct RadioButton<Value>: View where Value: Equatable {
    @Binding var selected: Value
    let value: Value

    var body: some View {
        Circle()
            .strokeBorder(Color.gray, lineWidth: 2)
            .background(
                Circle()
                    .foregroundColor(selected == value ? .orange : .clear)
            )
            .frame(width: 20, height: 20)
    }
}

struct CatInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CatInfoView()
    }
}
