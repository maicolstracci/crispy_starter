import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/UI/Widgets/card_list.dart';
import 'package:crispy_starter/UI/Widgets/data_list.dart';
import 'package:crispy_starter/api_keys.dart';
import 'package:crispy_starter/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'BLoC/Helpers/bloc_base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crispy Starter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
    void getDataFromIMDBAPI() async {
      try {
        Response response = await Dio()
            .get("https://imdb-api.com/en/API/Top250Movies/$imbd_api_key");
        print(response);
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
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
