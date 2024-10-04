// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/models/task_model.dart';

// class TaskService {
//   static CollectionReference<TaskModel> getTaskCollection() {
//     return FirebaseFirestore.instance
//         .collection('Tasks')
//         .withConverter<TaskModel>(
//       fromFirestore: (snapshot, _) {
//         return TaskModel.fromJson(snapshot.data()!);
//       },
//       toFirestore: (task, _) {
//         return task.toJson();
//       },
//     );
//   }

//   static Future<void> addTask(TaskModel task) async {
//     var collection = getTaskCollection();
//     var docRef = collection.doc();
//     task.id = docRef.id;
//     await docRef.set(task);
//   }

//   static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
//     var collection = getTaskCollection();
//     return collection
//         .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .where('date', isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
//         .snapshots();
//   }

//   static Future<void> deleteTask(String id) async {
//     await getTaskCollection().doc(id).delete();
//   }

//   static Future<void> updateTaskStatus(TaskModel task) async {
//     await getTaskCollection().doc(task.id).update(task.toJson());
//   }
// }
