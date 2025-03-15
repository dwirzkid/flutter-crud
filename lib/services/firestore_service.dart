import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // get collection of notes
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  // CREATE
  Future<void> addCustomer(Map<String, dynamic> customerData) async {
    try {
      await _db.collection('customers').add(customerData);
    } catch (e) {
      throw e;
    }
  }

  // READ
  Stream<QuerySnapshot> getCustomers() {
    return _db.collection('customers').orderBy('createdAt', descending: true).snapshots();
  }



  // UPDATE
  Future<void> updateCustomer(String customerId, Map<String, dynamic> data) async {
  try {
    await _db.collection('customers').doc(customerId).update(data);
  } catch (e) {
    throw e;
  }
}



  // DELETE
  Future<void> deleteCustomer(String customerId) async {
    try {
      await _db.collection('customers').doc(customerId).delete();
    } catch (e) {
      throw e;
    }
  }

}