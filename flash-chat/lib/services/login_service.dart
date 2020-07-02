import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static final LoginService _instance = LoginService._internal();

  bool _googleSignIn = false;
  FirebaseUser _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  factory LoginService() => _instance;

  LoginService._internal();

  Future<AuthResult> registerWithEmail({String email, String password}) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        _user = await _auth.currentUser();
      }
      return newUser;
    } catch (e) {
      throw new Exception('Could not register with email provided! $e');
    }
  }

  Future<AuthResult> signInWithEmail({String email, String password}) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (user != null) {
      _user = await _auth.currentUser();
    }
    return user;
  }

  Future<FirebaseUser> signInWithGoogle() async {
    print('singInWithGoogle()');
    print('1');
    bool signedIn = await _googleAuth.isSignedIn();
    if (signedIn) {
      print('2');
      _user = await _auth.currentUser();
      print('user: $_user');
    }
    if (_user == null) {
      if (signedIn) {
        _googleAuth.signOut();
      }

      print('3');
      GoogleSignInAccount googleSignInAccount = await _googleAuth.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      _user = (await _auth.signInWithCredential(credential)).user;
    }
    print('4');
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
