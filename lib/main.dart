import 'file:///C:/Users/Maicol/AndroidStudioProjects/crispy_starter/lib/BLoC/Helpers/bloc_base.dart';
import 'file:///C:/Users/Maicol/AndroidStudioProjects/crispy_starter/lib/BLoC/Helpers/bloc_event_state.dart';
import 'package:crispy_starter/BLoC/increment_counter_bloc.dart';
import 'package:crispy_starter/Events/increment_counter_event.dart';
import 'package:crispy_starter/States/increment_counter_state.dart';
import 'package:crispy_starter/api_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'BLoC/Helpers/bloc_event_state_builder.dart';

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
      home: BlocProvider<IncrementCounterBloc>(
          blocBuilder: ()  => IncrementCounterBloc(),
          child: CrispyStarter()),
    );
  }
}


class CrispyStarter extends StatefulWidget {
  @override
  _CrispyStarterState createState() => _CrispyStarterState();
}

class _CrispyStarterState extends State<CrispyStarter> {
  @override
  Widget build(BuildContext context) {

    IncrementCounterBloc counterBloc = BlocProvider.of<IncrementCounterBloc>(context);

    print('$counterBloc');
    void getDataFromIMDBAPI() async {
      try {
        Response response = await Dio().get("https://imdb-api.com/en/API/Top250Movies/$imbd_api_key");
        print(response);
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Crispy Starter"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: ()=>counterBloc.emitEvent(IncrementCounterEvent()),
        child: Icon(
          Icons.add,
          size: 38,
        ),
      ),
      body: Container(
        child: BlocEventStateBuilder<IncrementCounterEvent, IncrementCounterState>(
          bloc: counterBloc,
          builder: (BuildContext context, IncrementCounterState state) {
            return Center(
              child: Text(
                state.counter.toString()
              ),
            );
          }

        ),
      ),
    );
  }
}
