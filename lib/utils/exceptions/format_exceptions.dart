class GFormatException implements Exception {

  final String message;

  const GFormatException([this.message = 'An unexpected format error occured. Please check your input.']);

  factory GFormatException.fromMessage(String message) {
    return  GFormatException(message);
  }

  String get formattedMessage => message;

  factory GFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format' :
        return const GFormatException('The Email address format is invalid. Please enter a valid email.');
      case 'invalid-password-format' :
        return const GFormatException('The Password format is invalid. Please enter a valid password.');
      case 'invalid-username-format' :
        return const GFormatException('The Username format is invalid. Please enter a valid username.');
      default :
        return const GFormatException();
    }
  }
}