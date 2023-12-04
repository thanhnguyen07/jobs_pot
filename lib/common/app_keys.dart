class ValidationKeys {
  static const String required = 'required';
  static const String number = 'number';
  static const String min = 'minLength';
  static const String nonAlphanumeric = 'nonAlphanumeric';
  static const String lowerCase = 'lowerCase';
  static const String upperCase = 'upperCase';
  static const String email = 'email';
  static const String password = 'psassword';
  static const String fullName = 'fullName';
  static const String location = 'location';
  static const String postTitle = 'postTitle';
  static const String postDescription = 'postDescription';
  static const String oldPassword = 'oldPassword';
  static const String newPassword = 'newPassword';
  static const String confirmNewPassword = 'confirmNewPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String different = 'different';
}

class FirebaseKeys {
  static const String weakPassword = 'weak-password';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String userNotFound = "user-not-found";
  static const String wrongPassword = "wrong-password";
  static const String tooManyRequests = "too-many-requests";
  static const String googleType = "google";
  static const String pathFolderUserImage = "user_images";
  static const String pathFolderPostImage = "post_images";
  static const String accountExistsWithDifferentCredential =
      "account-exists-with-different-credential";
  static const String providerAlreadyLinked = "provider-already-linked";
  static const String invalidLoginCredentials = "INVALID_LOGIN_CREDENTIALS";
}

class ProviderKeys {
  static const String google = "google.com";
  static const String facebook = "facebook.com";
  static const String password = "password";
}

class ApiParameterKeyName {
  static const String userNameSnake = "user_name";
  static const String providerDataSnake = "provider_data";
  static const String providerIdSnake = "provider_id";
  static const String tokenFirebaseSnake = "token_firebase";
  static const String refreshTokenSnake = "refresh_token";
  static const String userNameCamel = "userName";
  static const String dateOfBirthCamel = "dateOfBirth";
  static const String phoneNumberCamel = "phoneNumber";
  static const String displayNameCamel = "displayName";
  static const String photoURLCamel = "photoURL";
  static const String email = "email";
  static const String code = "code";
  static const String id = "id";
  static const String file = "file";
  static const String gender = "gender";
  static const String location = "location";
  static const String uid = "uid";
}
