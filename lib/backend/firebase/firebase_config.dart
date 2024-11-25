import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDlYzilN51lpkEoQZZ9uMQvOg07MgpjAnQ",
            authDomain: "appteologia.firebaseapp.com",
            projectId: "appteologia",
            storageBucket: "appteologia.appspot.com",
            messagingSenderId: "673712190090",
            appId: "1:673712190090:web:369618dfb2fe727d58b373",
            measurementId: "G-ZLRS0TFMFP"));
  } else {
    await Firebase.initializeApp();
  }
}
