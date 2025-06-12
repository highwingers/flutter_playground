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


  Future<UserCredential?> signInWithApple() async {


try {


    final appleCred = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName
    ],
    webAuthenticationOptions: WebAuthenticationOptions(clientId: 'www.tutorials.flutterplayground.service', redirectUri: Uri.parse('https://ntfy-fcm-2fcf1.firebaseapp.com/__/auth/handler')));

    final oAuthCred = OAuthProvider("apple.com").credential(
      idToken: appleCred.identityToken,
      accessToken:  appleCred.authorizationCode,
    );
    var r = await _firebaseAuth.signInWithCredential(oAuthCred);
    print(_firebaseAuth.currentUser?.uid);
    return r;

} catch(e) {
  print("Error: $e")  ;
}
  }


}