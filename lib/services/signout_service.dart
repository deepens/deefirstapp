//import 'package:flutter/material.dart';
import 'package:deefirstapp/services/navigation_service.dart';
import 'package:deefirstapp/services/shareddata_service.dart';
import 'package:deefirstapp/shared/locator.dart';
import 'package:deefirstapp/shared/routing_constants.dart';
import 'package:deefirstapp/shared/shareddata_constants.dart';

class SignOutService {
  

 //final AuthService _authService = locator<AuthService>();
 // final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SharedDataService _sharedDataService = locator<SharedDataService>();
  //final GlobalKey<State> _progressDialogLoader = GlobalKey<State>();
  //final UserService _userService = locator<UserService>();

    //var hasLoggedInUser = await _authService.isUserLoggedIn();
    signOut() async{
     
    
    await _sharedDataService.setSharedData(ISUSERLOGGEDIN,YES); 
    print("Signout->"+ _sharedDataService.getSharedData(ISUSERLOGGEDIN).toString());
      _navigationService.navigateTo(SignInViewPageRoute);
    
    }
  }


