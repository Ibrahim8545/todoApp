import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/task_model.dart';

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

  static  Future<void>addTask(TaskModel task) {
    var collection = getTaskCollection();

    var docRef = collection.doc();

    task.id = docRef.id;

    return docRef.set(task);
  }
}
