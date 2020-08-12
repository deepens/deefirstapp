//import 'package:compound/models/post.dart';
//import '../shared/ui_helpers.dart';
//import '../widgets/post_item.dart';

import 'package:deefirstapp/shared/ui_helpers.dart';
import 'package:deefirstapp/views/constants.dart';
//import '../shared/shareddata_constants.dart';
import '../viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
//import '../services/shareddata_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //final SharedDataService _sharedDataService = locator<SharedDataService>();
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      //onModelReady: (model) => model.listenToPosts(),
      builder: (context, model, child) =>  SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Home Page",style: TextStyle(
                        color: Colors.white
                      ),),
                     backgroundColor: kPrimaryColor,
                    ),
                    body:  Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: <Widget>[
                //Text(_sharedDataService.getSharedData(ISUSERLOGGEDIN).toString()),
               
                verticalSpaceMassive,
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
