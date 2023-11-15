class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown exception occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'The password provided is too weak.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'The email address is badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'The email address is already in use by another account.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'The email/password sign-in provider is disabled.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'The user account has been disabled by an administrator.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
