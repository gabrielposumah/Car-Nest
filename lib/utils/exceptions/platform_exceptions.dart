class GPlatformException implements Exception {
  final String code;

  GPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS' :
        return 'Invalid login credentials. Please double-check your infomation.';
      case 'too-many-requests' :
        return 'Too many request. Please try again later.';
      case 'invalid-argument' :
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password' :
        return 'Incorrect password. Please try again later.';
      default :
        return 'An error occurred.';
    }
  }
}