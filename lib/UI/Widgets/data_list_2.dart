import 'package:crispy_starter/UI/Widgets/data_list.dart';
import 'package:flutter/material.dart';

class DataList2 extends StatelessWidget {
  final PageController pageController = Singleton().pageController;
  final PageController controller2 = PageController();

  @override
  Widget build(BuildContext context) {

    pageController.addListener(() {
      if (pageController.positions.length > 0) {
        if (controller2.hasClients) {
          controller2.jumpTo(pageController.position.pixels);
        }
      }
    });

    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller2,
        itemBuilder: (context, indexPage) => ListView.builder(
            itemBuilder: (ctx, index) => Container(
                  height: 40,
                  color: Colors.redAccent,
                  margin: EdgeInsets.all(18),
                  child: Center(
                    child: Text("Testo $index pagina $indexPage"),
                  ),
                )));
  }
}
