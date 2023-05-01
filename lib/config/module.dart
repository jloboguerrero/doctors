import 'package:doctors/app/home/page.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'package:doctors/app/armors/module.dart';
// import 'package:doctors/app/onboarding/page.dart' as onboarding;
// import 'package:doctors/app/terms/page.dart' as terms;
// import 'package:doctors/app/option_two/page.dart' as option;
import 'package:doctors/config/app_config.dart';
import 'package:doctors/config/preferences.dart';
import 'package:doctors/app/login/page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Preferences()),
        Bind((i) => AppConfig()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const LogIn(),
          transition: TransitionType.fadeIn,
        ),
        // ModuleRoute(
        //   '/armors',
        //   module: Home(),
        // ),
      ];
}
