import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  // todo add IF dev load env vars like this
  await dotenv.load(fileName: ".env");
  runApp(
    const App(),
  );
}
