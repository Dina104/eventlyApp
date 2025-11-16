import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_app/models/category_model.dart';
import 'package:evently_app_app/models/event_model.dart';
import 'package:evently_app_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static const String usersCollection = "Users";

  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollectionRef = db
        .collection(usersCollection) // Use constant
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    DocumentReference<UserModel> userDocument = usersCollectionRef.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel?> getUsersFromFireStoreById(String uid) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference<UserModel> usersCollectionRef = db
          .collection(usersCollection) // Use constant
          .withConverter<UserModel>(
            fromFirestore:
                (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );
      DocumentReference<UserModel> userDocument = usersCollectionRef.doc(uid);
      DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      }
      return null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  static CollectionReference<EventModel> getEventsCollection(
    BuildContext context,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore:
              (snapshot, _) => EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> EventCollection = getEventsCollection(
      context,
    );

    DocumentReference<EventModel> eventDocument = EventCollection.doc();
    return eventDocument.set(event);
  }

  static getEventWithRealTimeUpdate(
    BuildContext context,
    CategoryModel category,
  ) {
    CollectionReference<EventModel> eventCollections = getEventsCollection(
      context,
    );
    Stream<QuerySnapshot<EventModel>> querySnapshotStream = eventCollections
        .where("categotyId", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("dateTime")
        .snapshots();
    querySnapshotStream.map((querySnapshot)=>querySnapshot.docs.map((documentsnapshot)=>documentsnapshot.data()).toList());
  }

  static Future<List<EventModel>> getEvents(
    BuildContext context,
    CategoryModel category,
  ) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot =
        await eventsCollection
            .where(
              "categoryId",
              isEqualTo: category.id == "0" ? null : category.id,
            )
            .orderBy("dateTime")
            .get();
    List<EventModel> events =
        querySnapshot.docs
            .map((documentSnapshot) => documentSnapshot.data())
            .toList();
    return events;

    //   if (category.id == "0") {
    //     return events;
    //   }
    //   events = events.where((event) =>
    //    event.category.id == category.id).toList();
    //   return events;
    // }
  }

  static Future<void> addEventToFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.add(event.eventId);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
      currentUser.id,
    );
    return userDocument.set(currentUser);
  }

  static Future<void> removeEventFromFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.remove(event.eventId);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
      currentUser.id,
    );
    return userDocument.set(currentUser);
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(usersCollection)
        .withConverter<UserModel>(
          fromFirestore:
              (snapshot, _) => UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<List<EventModel>> getFavouriteEvents(
    BuildContext context,
  ) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection.get();
    List<QueryDocumentSnapshot<EventModel>> documentsnapshots =
        querySnapshot.docs;
    List<EventModel> events =
        documentsnapshots.map((docsnapshot) => docsnapshot.data()).toList();
    List<EventModel> favouriteEvents =
        events
            .where(
              (events) => UserModel.currentUser!.favouriteEventsIds.contains(
                events.eventId,
              ),
            )
            .toList();
    return favouriteEvents;
  }
}
