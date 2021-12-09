import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final String time = DateTime.now().toString().substring(0, 20);

class Database {
  static Future<void> addItem({
    required String title,
    required String description,
    required String user,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "user": user,
      "time": time,
      "likes": 0
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateLikes({
    required int likes,
    required String docId,
  }) async {
    int increment = 1 + likes;

    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> decrementLikes({
    required int likes,
    required String docId,
  }) async {
    int increment = likes - 1;

    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('items').orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

//-----------------------------------Comments------------------------------------------------------
  static Future<void> addComment(
      {required String comment,
      required String user,
      required String title}) async {
    DocumentReference documentReferencer =
        _firestore.collection('comments').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "user": user,
      "comment": comment,
      "time": time,
      "title": title
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readComments(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('comments')
        .where("title", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }
}
