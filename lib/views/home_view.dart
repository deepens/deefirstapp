//import 'package:compound/models/post.dart';
//import '../shared/ui_helpers.dart';
//import '../widgets/post_item.dart';
import 'package:deefirstapp/shared/locator.dart';
import '../shared/shareddata_constants.dart';
import '../viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../services/shareddata_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final SharedDataService _sharedDataService = locator<SharedDataService>();
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      //onModelReady: (model) => model.listenToPosts(),
      builder: (context, model, child) => Scaffold(
        primary:false,
        backgroundColor: Colors.white,
        body: SafeArea(
                  child: Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Text(_sharedDataService.getSharedData(ISUSERLOGGEDIN).toString()),
                RaisedButton(
                  child: Text("Signout"),
                  onPressed: (){
                  model.signOut();
                }),
                ],),
            ),
          ),
        ),
      ),
    );
  }
}
