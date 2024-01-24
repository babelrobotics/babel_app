import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:babelbots/services/auth.dart';
import 'package:babelbots/services/models.dart';

class FireStoreService {
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

  Future<void> createOrUpdateUser(firebase_user.User? user) async {
    if (null != user) {
      DocumentReference userDocRef = _db.collection('users').doc(user.uid);

      var userDoc = await userDocRef.get();
      if (!userDoc.exists) {
        // Create a new user document
        userDocRef.set({
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'profilePicture': user.photoURL ?? '',
          'createdDateTime': Timestamp.now(),
          'points': 0
          // Initialize other fields as needed
        });
      } else {
        print('##user exists');
        // Update existing user document if necessary
        userDocRef.update({
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'profilePicture': user.photoURL ?? '',
          // Update other fields as needed
        });
      }
    }
  }

  // Fetches the user information from Firestore using firebase_user.User
  Future<User?> getUserFromFirestore(firebase_user.User? firebaseUser) async {
    if (firebaseUser != null) {
      try {
        DocumentReference userDocRef = _db.collection('users').doc(firebaseUser.uid);
        DocumentSnapshot userSnapshot = await userDocRef.get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
          if (userData != null) {
            return User.fromJson(userData); // Assuming you have a User model with a fromJson method
          }
        }
        return null; // Return null if user does not exist or data is not available
      } catch (e) {
        print('Error getting user from Firestore: $e');
        return null; // Handle exceptions and return null if an error occurs
      }
    } else {
      return null; // Return null if firebase_user.User is null
    }
  }

  // Listens to current user's report document in Firestore
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }
}