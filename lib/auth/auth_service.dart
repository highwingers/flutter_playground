import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Install the firebase CLI
// npm install -g firebase-tools

// firebase login
// dart pub global activate flutterfire_cli

// within flutter project run
// flutterfire configure
// choose your project from list

//for Android add SHA1 and SHA256
//for iso populate the info.plist

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  signInWithGoogle() async {
    // interactive signin
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: <String>['email'],
  );
  Future<GoogleSignInAccount?> GoogleSignInWithoutFireBase() async {
    try {
      var google = await _googleSignIn.signIn();
      print('User signed in with Google. : ${google?.email}');
      return google;
    } catch (error) {
      print(error);
    }
  }

  Future<UserCredential?> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      final UserCredential userCredential = await _firebaseAuth
          .signInWithProvider(appleProvider);
      print('User Within Service is signed in: ${userCredential.user?.uid}');
      return userCredential;
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
