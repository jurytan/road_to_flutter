import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static final LoginService _instance = LoginService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  factory LoginService() => _instance;

  LoginService._internal();

  Future<FirebaseUser> signInWithGoogle() async {
    FirebaseUser user;
    bool signedIn = await _googleSignIn.isSignedIn();
    if (signedIn) {
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      // final authHeaders = _googleSignIn.currentUser.authHeaders;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
    }
    return user;
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  FirebaseAuth get firebaseAuth => _auth;

  GoogleSignIn get googleAuth => _googleSignIn;
}
