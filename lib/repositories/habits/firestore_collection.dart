import 'package:cloud_firestore/cloud_firestore.dart';

/// This class exists mainly for unit test mocking, however last time I tried to mock it,
/// there was a problem mocking QueryDocumentSnapshot related to null safety and so the test failed.
/// Need to check back in on this in the future in order to add test cases for the project's repos.
class FirestoreCollection {
  final collectionName;

  FirestoreCollection(this.collectionName);

  CollectionReference<Map<String, dynamic>> get collection => FirebaseFirestore.instance.collection(collectionName);
  Stream<QuerySnapshot<Map<String, dynamic>>> get snapshots => collection.snapshots();
  DocumentReference<Map<String, dynamic>> doc([String? path]) => collection.doc(path);
}