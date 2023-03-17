import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? user = auth.currentUser;
  // final uid = user?.uid;
  //
  // if (user == null) {
  // print("No User");
  // }
  //
  // final CollectionReference postsRef = FirebaseFirestore.instance
  //     .collection('UserDataInfo')
  //     .doc('user123') // assume that user123 has a "posts" subcollection
  //     .collection('MyProduct');



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('UserDataInfo').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot user = snapshot.data!.docs[index];
              String userId = user.id;

              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('UserDataInfo')
                    .doc(userId)
                    .collection('MyProduct')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> subSnapshot) {
                  if (!subSnapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  List<DocumentSnapshot> subDocs = subSnapshot.data!.docs;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('User ID: $userId'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: subDocs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot subDoc = subDocs[index];

                          return ListTile(
                            title: Text(subDoc['Location']),
                            subtitle: Text(subDoc['Location']),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
