import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }


  
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();

    var docRef = collection.doc();

    task.id = docRef.id;

    return docRef.set(task);
  }

    static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();

    var docRef = collection.doc(user.id);

    return docRef.set(user);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getTaskCollection();
    return collection.where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTasks(String id) {
    return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateStatus(TaskModel task) {
    return getTaskCollection().doc(task.id).update(task.toJson());
  }

  static login({required String emailAddress,required  String password,
       required Function onSucess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credential.user?.emailVerified==true)
          {
            onSucess();
          }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }

  static createAccount(String emailAddress, String password,
      {required Function onSucess,
       required Function onError, 
       required String userName, 
       required String phone,
        required int age,
        }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: emailAddress,
        userName: userName ,
        phone: phone,
        age: age,
        
        );
      addUser(userModel);
      credential.user?.sendEmailVerification();
      onSucess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }
}
