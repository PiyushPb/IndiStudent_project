import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indistudent/common/constants/constants.dart';
import 'package:indistudent/common/constants/firebase_constants.dart';
import 'package:indistudent/core/failure.dart';
import 'package:indistudent/core/type_defs.dart';
import 'package:indistudent/models/user_mode.dart';
import 'package:indistudent/providers/firebase_providors.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
      firestore: ref.read(fireStoreProvider),
      auth: ref.read(authProvidor),
      googleSignIn: ref.read(googleSignProvidor),
    ));

class AuthRepository {
  FirebaseFirestore _firestore;
  FirebaseAuth _auth;
  GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

    Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle() async {
    UserCredential userCredential;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      UserModel userModel;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          name: userCredential.user!.displayName ?? 'Untitled',
          email: userCredential.user!.email!,
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true,
          karma: 0,
          awards: [],
        );

        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }

      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
