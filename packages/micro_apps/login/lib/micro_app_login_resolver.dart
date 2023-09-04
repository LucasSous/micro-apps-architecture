import 'package:login/core/inject/inject.dart';
import 'package:login/presentation/ui/pages/login_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (context, args) => const LoginPage(),
      };

  @override
  void Function() get injectionsRegister => () {
        Inject.init();
      };

  @override
  void Function() get createListener => () {};
}
