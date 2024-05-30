class GFirebaseAuthException implements Exception {
  final String code;

  GFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use' :
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email' :
        return 'The email address is provided is invalid. Please enter a valid email.';
      case 'weak-password' :
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled' :
        return 'This user account has been disabled. Please contact support for asistance.';
      case 'user-not-found' :
        return 'Incorrect password. Please try again.';
      case 'wrong-password' :
        return 'Incorrect password. Please try again.';
      case 'invalid-verification-code' :
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id' :
        return 'Invalid verification id. Please try again.';
      case 'quota-exceeded' :
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists' :
        return 'The email address already exists. Please try again later.';
      default :
        return 'An error occurred. Please try again later.';
    }
  }
}