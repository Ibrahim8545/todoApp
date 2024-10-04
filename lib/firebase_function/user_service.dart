// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todoapp/models/user_model.dart';

// class UserService {
//   static CollectionReference<UserModel> getUserCollection() {
//     return FirebaseFirestore.instance
//         .collection('Users')
//         .withConverter<UserModel>(
//       fromFirestore: (snapshot, _) {
//         return UserModel.fromJson(snapshot.data()!);
//       },
//       toFirestore: (user, _) {
//         return user.toJson();
//       },
//     );
//   }

//   static Future<void> addUser(UserModel user) async {
//     var collection = getUserCollection();
//     var docRef = collection.doc(user.id);
//     await docRef.set(user);
//   }

//   static Future<UserModel?> readUser() async {
//     DocumentSnapshot<UserModel> docRef = await getUserCollection()
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     return docRef.data();
//   }
// }
