import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() async {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // Create a CollectionReference called users that references the firestore collection
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text('data'),
            GetUserName('Tul'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () async {
          // CREATE USER
          // try {
          //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //     email: 'jlobo12@gmail.com',
          //     password: '123456',
          //   );
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'weak-password') {
          //     print('The password provided is too weak.');
          //   } else if (e.code == 'email-already-in-use') {
          //     print('The account already exists for that email.');
          //   }
          // } catch (e) {
          //   print(e);
          // }

          // LOGIN
          // try {
          //   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          //     email: 'jlobo12@gmail.com',
          //     password: '123456',
          //   );
          //   print('here is $credential');
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'user-not-found') {
          //     print('No user found for that email.');
          //   } else if (e.code == 'wrong-password') {
          //     print('Wrong password provided for that user.');
          //   }
          // }

          // CREATE COLLECTION
          // CollectionReference dates = FirebaseFirestore.instance.collection('dates');
          // final creacion = dates
          // .add({
          //   'day': 14,
          //   'name': 'domingo', // Stokes and Sons
          //   'rent': 0, // 42
          // })
          // .then((value) {
          //   print("User Added");
          //   print('here is value $value');
          // })
          // .catchError((error) => print("Failed to add user: $error"));
          // print('here is creacion $creacion');

          // OBTENER DATOS
          // FirebaseFirestore.instance
          //     .collection('users')
          //     .get()
          //     .then((QuerySnapshot querySnapshot) {
          //         querySnapshot.docs.forEach((doc) {
          //             print(doc["full_name"]);
          //         });
          //     });

          // CON QUERYES
          // FirebaseFirestore.instance
          //     .collection('users')
          //     .where('age', isGreaterThan: 20)
          //     .get()
          //     .then((value) {
          //         print('here is value $value');

          //     }
          //     );

          // QUERYES with limit
          // FirebaseFirestore.instance
          //   .collection('dates')
          //   .where('day', isGreaterThan: 7)
          //   .limit(7)
          //   .get()
          //   .then((QuerySnapshot querySnapshot) {
          //       querySnapshot.docs.forEach((doc) {
          //           print(doc["name"]);
          //           print(doc["rent"]);
          //           print(doc.id);
          //       });
          //   });

          // UPDATE RENT
          // CollectionReference dates = FirebaseFirestore.instance.collection('dates');
          // dates
          //   .doc('7NktDNaL1gcb4gXPyVec')
          //   .update({'rent': 3})
          //   .then((value) => print("User Updated"))
          //   .catchError((error) => print("Failed to update user: $error"));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class GetUserName extends StatelessWidget {
  final String company;

  GetUserName(this.company);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(company).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("company does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
