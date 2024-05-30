class GFirebaseException implements Exception {
  final String code;

  GFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Fireabase error occured. Please Try again.';
      case 'invalid-costume-token':
        return 'The costum token format is incorrect. Please check your costume token.';
      default:
        return 'An error occurred. Please try again later.';
    }
  }
}
