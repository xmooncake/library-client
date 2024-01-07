class AuthenticationRepository {
  bool isUserAuthenticated({
    required String email,
    required String password,
  }) {
    return true;
  }
}

// final isAuth = isUserAuthenticated(email, password);
// final isAuth = isUserAuthenticated(email: email,password: password);
