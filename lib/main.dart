import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_crypt/service/secure_storage_service.dart';
import 'package:routemaster/routemaster.dart';
import 'controller/auth_controller.dart';
import 'models/user.dart';
import 'routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage((message) async {
    print("background message received");
    print(message.toMap().toString());
  });
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser(){
    SecureStorage().getUser().then((User? currentUser){
      ref.read(userProvider.notifier).update((state) => currentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'N-crypt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        final User? user = ref.watch(userProvider);
        // if (user != null) {
        //   return loggedInRoute;
        // }
        return loggedOutRoute;
      }),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
