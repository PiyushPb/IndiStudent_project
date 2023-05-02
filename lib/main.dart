import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/common/error_text.dart';
import 'package:indistudent/common/loader.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/firebase_options.dart';
import 'package:indistudent/landingpage.dart';
import 'package:indistudent/models/user_mode.dart';
import 'package:indistudent/router.dart';
import 'package:indistudent/screen/login.dart';
import 'package:indistudent/screen/login_pages/email_sent.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';
import 'package:indistudent/screen/user_create_form/user_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ref.watch(authStateChangeProvider).when(
            data: (data) => MaterialApp.router(
                  title: 'Welcome to Flutter',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      fontFamily: 'poppins',
                      scaffoldBackgroundColor: Colors.white),
                  routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                    if (data != null) {
                      getData(ref, data);
                      if (userModel != null) {
                        return loggedInRoute;
                      }
                    } else {
                      return loggedOutRoute;
                    }
                    return landingPageRoute;
                  }),
                  routeInformationParser: const RoutemasterParser(),
                ),
            error: (error, StackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader());
      },
      maxTabletWidth: 900, // Optional
    );
  }
}
