import 'package:crispy_starter/constants.dart';
import 'package:crispy_starter/router.dart';
import 'package:crispy_starter/services/networking.dart';
import 'package:crispy_starter/theme_notifier.dart';
import 'package:crispy_starter/ui/widgets/card_list.dart';
import 'package:crispy_starter/ui/widgets/data_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/helpers/bloc_base.dart';
import 'bloc/swipe_card_bloc.dart';

const bool USE_MOCKED_DATA = true;

void main() {
  if (USE_MOCKED_DATA) NetworkingService().initNetworkingServiceInterceptor();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crispy Starter',
      onGenerateRoute: Router.generateRoute,
      theme: Provider.of<ThemeNotifier>(context).getThemeData(),
      home: BlocProvider<SwipeCardBloc>(
          blocBuilder: () => SwipeCardBloc(), child: CrispyStarter()),
    );
  }
}

class CrispyStarter extends StatefulWidget {
  @override
  _CrispyStarterState createState() => _CrispyStarterState();
}

class _CrispyStarterState extends State<CrispyStarter> {
  ValueNotifier<double> _notifier;

  @override
  void dispose() {
    _notifier?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _notifier = ValueNotifier<double>(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: NestedScrollView(
          headerSliverBuilder: (ctx, any) => [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CardList(notifier: _notifier),
            ),
          ],
          body: DataList(
            notifier: _notifier,
          ),
        ),
      ),
    );
  }
}
