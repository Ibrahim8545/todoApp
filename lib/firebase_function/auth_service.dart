// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todoapp/firebase_function/user_service.dart';
// import 'package:todoapp/models/user_model.dart';

// class AuthService {
//   static login({required String emailAddress,required  String password,
//        required Function onSucess, required Function onError, required Null Function() onSuccess}) async {
//     try {
//       final credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: emailAddress, password: password);
//          // if(credential.user?.emailVerified==true)
          
//             onSucess();
          
//     } on FirebaseAuthException catch (e) {
//       onError(e.message);
//     }
//   }

//   static Future<void> createAccount({
//     required String emailAddress,
//     required String password,
//     required Function onSuccess,
//     required Function onError,
//     required String userName,
//     required String phone,
//     required int age,
//   }) async {
//     try {
//       var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailAddress,
//         password: password,
//       );
//       UserModel userModel = UserModel(
//         id: credential.user!.uid,
//         email: emailAddress,
//         userName: userName,
//         phone: phone,
//         age: age,
//       );
//       await UserService.addUser(userModel);
//       await credential.user?.sendEmailVerification();
//       onSuccess();
//     } on FirebaseAuthException catch (e) {
//       onError(e.message);
//     } catch (e) {
//       onError(e.toString());
//     }
//   }
// }
