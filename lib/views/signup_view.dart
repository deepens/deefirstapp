import 'package:deefirstapp/viewmodels/signup_view_model.dart';
import 'package:deefirstapp/views/constants.dart';
//import 'package:deefirstapp/widgets/text_link.dart';
import 'package:flutter/material.dart';
import '../shared/ui_helpers.dart';
//import '../widgets/busy_button.dart';
//import '../widgets/expansion_list.dart';
//import '../widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final String emailValue = '';
  final String passwordValue = '';
  final String firstNameValue = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                  verticalSpaceMedium,
                  SizedBox(
                      height: 20,
                      child: !model.busy != false
                          ? Text(
                              model.getErrormessage().toString(),
                              style: TextStyle(
                                color: Colors.redAccent[700],
                              ),
                            )
                          : Text("")
                      //child:_image,

                      ),
                  FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: FormBuilderTextField(
                            attribute: "First Name",
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: "Name",
                              border: InputBorder.none,
                            ),
                            controller: firstNameController,
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: "First name cannot be empty"),
                              FormBuilderValidators.minLength(2),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: FormBuilderTextField(
                            attribute: "E-mail",
                            controller: emailController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: kPrimaryColor,
                              ),
                              hintText: "E-mail",
                              border: InputBorder.none,
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: "E-mail cannot be empty"),
                              FormBuilderValidators.minLength(6,
                                  errorText:
                                      "E-mail cannot be less than 6 digit"),
                              //FormBuilderValidators.pattern(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',errorText: "Please enter a Valid e-mail id"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: FormBuilderTextField(
                            obscureText: true,
                            attribute: "Password",
                            controller: passwordController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: kPrimaryColor,
                              ),
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: "Password cannot be empty"),
                              FormBuilderValidators.minLength(3,
                                  errorText:
                                      "Password cannot be less than 3 digit"),
                              //FormBuilderValidators.pattern(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceMedium,
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (_fbKey.currentState.validate()) {
                            model.signUp(
                                email:
                                    emailController.text.trim().toLowerCase(),
                                password: passwordController.text,
                                firstname: firstNameController.text
                                    .trim()
                                    .toLowerCase(),
                                context: context);
                          } else {
                            return null;
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an Account ? ",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.navigateToSignIn();
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Divider(),
                        SignInButton(
                          Buttons.Google,
                          onPressed: () {},
                        ),
                        Divider(),
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {},
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
