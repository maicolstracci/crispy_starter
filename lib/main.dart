import 'package:crispy_starter/BLoC/swipe_card_bloc.dart';
import 'package:crispy_starter/UI/Widgets/card_list.dart';
import 'package:crispy_starter/UI/Widgets/data_list.dart';
import 'package:crispy_starter/api_keys.dart';
import 'package:crispy_starter/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  PageController _pageController;

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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              pinned: true,
              floating: false,
              expandedHeight: 250.0,
              collapsedHeight: 180,
              title: Text('I miei conti'),
              centerTitle: true,
              flexibleSpace: SizedBox.expand(
                child: CardList(controller: _pageController),
              ),
            ),
            DataList()
          ],

//        child: Column(
//          children: [
//            Container(height: 200, child: CardList()),
//            Expanded(child: DataList()),
//          ],
        ),
      ),
    );
  }
}
