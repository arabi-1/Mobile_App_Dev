import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:recipe_app/screens/auth_wrapper.dart';
import 'package:recipe_app/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // MultiProvider is used to manage multiple providers in one place
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const RecipeApp(),
    ),
  );
}

// THIS is the class you were missing!
class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App Pro',
      debugShowCheckedModeBanner:
          false, // Hides the "Debug" banner for a clean look
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true, // Uses modern Android styling
      ),
      // We set the AuthWrapper as the starting point
      home: const AuthWrapper(),
    );
  }
}
