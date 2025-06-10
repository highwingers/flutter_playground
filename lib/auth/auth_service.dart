import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
}