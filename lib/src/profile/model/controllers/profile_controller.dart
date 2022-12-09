class ProfileController {
  ///[getUsername] is to get the current username based on email
  String getUsername(String email) => email.split('@')[0];

  ///[getUserID] is to get a dummy ID for the user based on the real uid from Firebase
  String getUserID(String uid) => uid.substring(0, 7);
}
