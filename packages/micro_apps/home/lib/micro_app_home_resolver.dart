import 'package:eventbus/eventbus.dart';
import 'package:home/apresentatio/ui/pages/home_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/home': (_, __) => const HomePage(),
      };

  @override
  void Function() get injectionsRegister => () {};

  @override
  void Function() get createListener => () {
        EventBus.listen((event) {
          print(event);
        });
      };
}
