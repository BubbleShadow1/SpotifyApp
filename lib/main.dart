import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify/features/presentation/bloc/themebackend.dart';
import 'package:spotify/features/presentation/credential/credential_cubit.dart';
import 'package:spotify/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:spotify/firebase_options.dart';
import 'core/config/theme/theme.dart';
import 'features/presentation/Pages/Splash/pages/splash.dart';
import 'package:spotify/injection_container.dart ' as di;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ BlocProvider(create: (_) => Themebackend()),
      BlocProvider(create:(_)=>di.sl<AuthCubit>()..appstarted()),BlocProvider(create: (_)=>di.sl<CredentialCubit>())],
      child: BlocBuilder<Themebackend, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: Themesname.lightTheme,
          darkTheme: Themesname.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: Splash(),
        ),
      ),
    );
  }
}
