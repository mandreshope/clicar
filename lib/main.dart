import 'package:clicar/app/presentation/routes/app_observer.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/di/injection_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clicar/di/injection_container.dart' as di; //Dependency injector

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di
      .init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)

  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: GlobalBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Clicar',
        theme: CustomTheme.themeData,
        localizationsDelegates: const [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: AppRoutes.routes,
        supportedLocales: const [
          Locale('fr', 'FR'),
          Locale('en', 'US'),
        ],
        initialRoute: AppRoutes.splash,
        locale: const Locale('fr', 'FR'),
        navigatorObservers: [AppObserver()],
      ),
    );
  }
}
