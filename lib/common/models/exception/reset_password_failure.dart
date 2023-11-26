class ResetPasswordFailure implements Exception {
  final String message;

  const ResetPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory ResetPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const ResetPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const ResetPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const ResetPasswordFailure(
          'Email is not found, please create an account.',
        );
      default:
        return const ResetPasswordFailure();
    }
  }
}