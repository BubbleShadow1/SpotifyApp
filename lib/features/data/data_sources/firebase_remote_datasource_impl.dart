import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/features/data/data_sources/firebase_remote_datasource.dart';
import 'package:spotify/features/data/models/user_model.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';


class FirebaseRemoteDatasourceImpl implements FirebaseRemoteDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDatasourceImpl(
      {required this.firestore,
      required this.auth,
      required this.googleSignIn});

  @override
  Future<void> Forgotpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> GetCurrentUID() async {
    return await auth.currentUser!.uid;
  }

  @override
  Future<void> SignIn(user_entities user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> SignOut() async {
    await auth.signOut();
  }

  @override
  Future<void> SignUp(user_entities user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> getUpdateuser(user_entities user) async {}

  @override
  Future<void> getcreatecurrentuser(user_entities user) async {
    final userCollection = firestore.collection("users");
    final uid = await GetCurrentUID();
    userCollection.doc(uid).get().then((userDoc) {
      if (!userDoc.exists) {
        final newuser =
            UserModel(uid: user.uid, email: user.email, password: user.password)
                .toDocument();

        if (!userDoc.exists) {
          userCollection.doc(uid).set(newuser);
        }
      }
    });
  }

  @override
  Future<void> googleAuth() async {
    
  }

  @override
  Future<bool> isSigIn() async {
    return auth.currentUser?.uid != null;
  }
}
