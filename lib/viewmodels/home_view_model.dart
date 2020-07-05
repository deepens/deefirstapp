//import 'package:flutter/material.dart';
// import 'package:deefirstapp/services/auth_service.dart';
// import 'package:deefirstapp/services/dialog_service.dart';
// import 'package:deefirstapp/services/navigation_service.dart';
// import 'package:deefirstapp/services/shareddata_service.dart';
// import 'package:deefirstapp/services/user_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:deefirstapp/shared/routing_constants.dart';
// import 'package:deefirstapp/shared/shareddata_constants.dart';
// import 'package:deefirstapp/viewmodels/startup_view_model.dart';
// import 'package:deefirstapp/services/navigation_service.dart';
import 'package:deefirstapp/services/signout_service.dart';
import '../services/signout_service.dart';
import '../viewmodels/base_model.dart';
import 'package:deefirstapp/shared/locator.dart';

class HomeViewModel extends BaseModel {
  

//  final AuthService _authService = locator<AuthService>();
//   final DialogService _dialogService = locator<DialogService>();
//   final NavigationService _navigationService = locator<NavigationService>();
//   final SharedDataService _sharedDataService = locator<SharedDataService>();
  //final GlobalKey<State> _progressDialogLoader = GlobalKey<State>();
  //final UserService _userService = locator<UserService>();
  final SignOutService _signOutService = locator<SignOutService>();

    //var hasLoggedInUser = await _authService.isUserLoggedIn();
    signOut() async{
     // _navigationService.navigateTo(routeName)
      showProgressBar(true);
      _signOutService.signOut();
      showProgressBar(false);
    
    
    }
  }


