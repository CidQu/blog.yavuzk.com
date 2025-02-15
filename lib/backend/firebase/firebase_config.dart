import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDeVZ-a1WFsapzq2kAkdBMKWqRX_4NsviU",
            authDomain: "blogyavuzkcom-1y59jf.firebaseapp.com",
            projectId: "blogyavuzkcom-1y59jf",
            storageBucket: "blogyavuzkcom-1y59jf.firebasestorage.app",
            messagingSenderId: "157988426875",
            appId: "1:157988426875:web:27f0bda02f6a18c87dbede"));
  } else {
    await Firebase.initializeApp();
  }
}
