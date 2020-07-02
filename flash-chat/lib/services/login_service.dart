import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static final LoginService _instance = LoginService._internal();

  bool _googleSignIn = false;
  FirebaseUser _user = null;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  factory LoginService() => _instance;

  LoginService._internal();

  Future<FirebaseUser> registerWithEmail(
      {String email, String password}) async {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser != null) {
      _user = await _auth.currentUser();
    }
    return _user;
  }

  Future<FirebaseUser> signInWithEmail({String email, String password}) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (user != null) {
      _user = await _auth.currentUser();
    }
    return _user;
  }

  Future<FirebaseUser> signInWithGoogle() async {
    bool signedIn = await _googleAuth.isSignedIn();
    if (signedIn) {
      _user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleSignInAccount =
          await _googleAuth.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      _user = (await _auth.signInWithCredential(credential)).user;
    }
    _googleSignIn = true;
    return _user;
  }

  void signOutGoogle() async {
    await _googleAuth.signOut();
    _googleSignIn = false;
  }

  void logOut() async {
    if (_googleSignIn) {
      signOutGoogle();
    } else {
      _auth.signOut();
    }
    _user = null;
  }

  FirebaseAuth get firebaseAuth => _auth;

  GoogleSignIn get googleAuth => _googleAuth;

  bool get googleSignIn => _googleSignIn;

  bool get signedIn => _user != null;
}
