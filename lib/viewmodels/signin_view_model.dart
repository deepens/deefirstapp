import 'package:deefirstapp/services/shareddata_service.dart';
import 'package:deefirstapp/services/user_service.dart';
import '../shared/routing_constants.dart';
import 'package:flutter/material.dart';
import '../shared/locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import '../viewmodels/base_model.dart';
// import '../services/dialog_service.dart';
import '../shared/shareddata_constants.dart';

class SignInViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();
  //final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SharedDataService _sharedDataService = locator<SharedDataService>();
  //final GlobalKey<State> _progressDialogLoader = GlobalKey<State>();
  final UserService _userService = locator<UserService>();

  Future signIn(
      {@required String email,
      @required String password,
      BuildContext context}) async {
    showProgressBar(true);
    //LoadingService.showLoadingDialog(context,_progressDialogLoader) ;
    var result = await _userService.getUserid(email, password);
    
    if (result != null || result.length >= 1) {
      String token;
      token = await _authService.getUserToken();
      _sharedDataService.setSharedData(USERTOKEN, token);

      var isloggedin = await _userService.updateUserToken(result, token);
      if (isloggedin == "success") {
        setErrormessage("");
        showProgressBar(false);
        _sharedDataService.setSharedData(ISUSERLOGGEDIN, YES);
        
        _navigationService.navigateTo(HomePageRoute);
      } else {
        _sharedDataService.setSharedData(ISUSERLOGGEDIN, NO);
        
        setErrormessage("Sign In failed , In correct e-mail id or password");
        showProgressBar(false);
        // await _dialogService.showDialog(
        //     title: 'Sign In Failure',
        //     description: "Sign In failed , In correct e-mail id or password");
      }
    } else {
      _sharedDataService.setSharedData(ISUSERLOGGEDIN, NO);
      
      setErrormessage("Sign In failed , In correct e-mail id or password");
      showProgressBar(false);
      // await _dialogService.showDialog(
      //   title: 'Sign In Failure',
      //   description: "Sign In failed , In correct e-mail id or password",
      // );
    }
    
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignupViewPageRoute);
  }
}
