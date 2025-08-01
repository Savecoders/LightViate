import 'package:client_service/app.dart';
import 'package:client_service/firebase_options.dart';
import 'package:client_service/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client_service/providers/empleado_provider.dart';
import 'package:client_service/viewmodel/auth_viewmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  try {
    await dotenv.load(fileName: ".env"); // Load environment variables
  } catch (e) {
    throw Exception('Error loading .env file: $e'); // Print error if any
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => EmpleadoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
