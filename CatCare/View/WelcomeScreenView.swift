import SwiftUI

struct WelcomeScreenView: View {
    @StateObject private var viewModel = WelcomeScreenViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.model.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(viewModel.model.subtitle)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            Image("girl")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button(action: {
                print("Join button tapped!")
            }) {
                Text(viewModel.model.buttonTitle)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
        }
        .padding()
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
