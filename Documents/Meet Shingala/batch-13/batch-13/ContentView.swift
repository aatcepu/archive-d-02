import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var passward: String = ""
    @State private var username: String = "sandhya@gmail.com"
    @State private var Passward: String = "sandhya@1234"
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Image(.social)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250, alignment: .center)

                    Text("Welcome")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundStyle(.customepink)
                        .padding(.bottom, 10)

                    HStack(spacing: 12) {
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.gray)
                        TextField("Email or phone number", text: $email)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 55)
                    .background(.gray.opacity(0.08))
                    .cornerRadius(15)

                    HStack(spacing: 12) {
                        Image(systemName: "key.fill")
                            .foregroundStyle(.gray)
                        SecureField("Password", text: $passward)
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 55)
                    .background(.gray.opacity(0.08))
                    .cornerRadius(15)

                    if showError {
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundStyle(.red)
                    }

                    HStack {
                        Spacer()
                        Button {
                            print("Forgot password?")
                        } label: {
                            Text("Forgot password?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.customepink)
                        }
                    }

                    Button {
                        if email == username && passward == Passward {
                            showError = false
                            isLoggedIn = true
                        } else {
                            showError = true
                            errorMessage = "Invalid email or password"
                        }
                    } label: {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.customepink.opacity(0.8))
                            .cornerRadius(15)
                    }
                    .padding(.top, 5)

                    NavigationDestinationLinkHolder(isLoggedIn: $isLoggedIn)

                    Text("or")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.vertical, 5)

                    Button {
                        print("Google login")
                    } label: {
                        HStack(spacing: 10) {
                            Image(.google)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Continue with Google")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.gray.opacity(0.08))
                        .cornerRadius(15)
                    }

                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        NavigationLink(destination: AppSignUpView()) {
                            Text("Sign up")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.customepink)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
            }
        }
    }
}

struct NavigationDestinationLinkHolder: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationLink(destination: AppLoginPage(), isActive: $isLoggedIn) {
            EmptyView()
        }
    }
}

struct AppLoginPage: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Login Page!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.customepink)
        }
        .navigationTitle("Dashboard")
    }
}

struct AppSignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Sign Up Page!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.customepink)
        }
        .navigationTitle("Sign Up")
    }
}

#Preview {
    ContentView()
}

