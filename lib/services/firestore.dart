import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
import 'package:babelbots/services/auth.dart';
import 'package:babelbots/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;


/*=========================================================
            Modules
=========================================================*/  

  // Reads all documments from the modules collection 
  Future<List<Module>> getModules() async {
    var ref = _db.collection('modules');
    var snapshot = await ref.get();

    // Map each document to a Module object and include the document ID
    var modules = snapshot.docs.map((doc) {
      var data = doc.data();
      data['id'] = doc.id; // Include the document ID in the data map
      return Module.fromJson(data);
    }).toList();

    return modules;
  }

  // Fetches all units, optionally filtered by a moduleId
  Future<List<Unit>> getUnits({String? moduleId}) async {
    Query<Map<String, dynamic>> ref = _db.collection('units');

    if (moduleId != null) {
      // Filter units by moduleId if provided
      ref = ref.where('moduleId', isEqualTo: moduleId);
    }

    var snapshot = await ref.get();

    // Map each document to a Unit object and include the document ID
    var units = snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Include the document ID in the data map
      return Unit.fromJson(data);
    }).toList();

    return units;
  }

  // Fetches all sections for a specific unit
  Future<List<Section>> getSections(String unitId) async {
    var ref = _db.collection('units').doc(unitId).collection('sections');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var sections = data.map((d) => Section.fromJson(d));
    return sections.toList();
  } 

/*=========================================================
            Users
=========================================================*/

  Future<void> createUserFromAuthUser(firebase_user.User? user) async {
    if (null != user) {
      DocumentReference userDocRef = _db.collection('users').doc(user.uid);

      var userDoc = await userDocRef.get();
      if (!userDoc.exists) {
        // Create a new user document
        userDocRef.set({
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'picture': user.photoURL ?? '',
          'createdDateTime': Timestamp.now(),
          'points': 0
          // Initialize other fields as needed
        });
      }
    }
  }

  // Listens to changes to the user document in Firestore
  Stream<User?> userStream() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('users').doc(user.uid);
        return ref.snapshots().map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id;
          if (data.containsKey('createdDateTime') && data['createdDateTime'] is Timestamp) {
            // Convert Timestamp to DateTime and then to String
            DateTime dateTime = (data['createdDateTime'] as Timestamp).toDate();
            data['createdDateTime'] = DateFormat('MMM yyyy').format(dateTime);
          }
          return User.fromJson(data);
        });
      } else {
        return Stream.fromIterable([User()]);
      }
    });
  }

  Future<void> updateUserDetails(String userId, Map<String, dynamic> updatedValues) async {
    DocumentReference userDocRef = _db.collection('users').doc(userId);

    try {
      await userDocRef.update(updatedValues);
    } catch (e) {
      print('Error updating user data: $e');
      // Handle or rethrow the exception as needed
    }
  }

}