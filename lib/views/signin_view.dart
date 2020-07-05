//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:provider/provider.dart';
import '../shared/ui_helpers.dart';
//import '../widgets/busy_button.dart';
//import '../widgets/input_field.dart';
import '../widgets/text_link.dart';
import '../viewmodels/signin_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class SignInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final String emailValue='';
  final String passwordValue='';
  final String firstNameValue='';

  @override
  Widget build(BuildContext context) {
    

    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: ()=>SignInViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
                      child: SingleChildScrollView(
                                              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    child: Image.asset('assets/images/title.png'),
                   //child:_image,
                  ),
                  verticalSpaceMassive,
                  FormBuilder(
                    key: _fbKey,
                    child: Column(
                        children: <Widget>[
                          SizedBox(
                    height: 20,
                    child:!model.busy!=false? Text(model.getErrormessage(),
                    style:TextStyle(color: Colors.redAccent[700],),):Text("")
                   //child:_image,
                   
                  ),
                  verticalSpaceMedium,
                          FormBuilderTextField( 
                            attribute: "E-mail",
                            controller: emailController,
                            decoration: InputDecoration(labelText: "E-mail"),
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: "E-mail cannot be empty"),
                              FormBuilderValidators.minLength(6,
                                  errorText:
                                      "E-mail cannot be less than 6 digit"),
                              //FormBuilderValidators.pattern(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',errorText: "Please enter a Valid e-mail id"),
                            ],
                          ),
                          FormBuilderTextField(
                            obscureText: true,
                            onChanged: (val)=>passwordController.text,
                            attribute: "Password",
                            controller: passwordController,
                            decoration: InputDecoration(labelText: "Password"),
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
                        ],
                    ),
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     RaisedButton(
                          child: Text("Sign In"),
                          onPressed: () {
                            if (_fbKey.currentState.validate()) {
                              model.signIn(
                                  email:
                                      emailController.text.trim().toLowerCase(),
                                  password: passwordController.text.trim(),
                                  context: context);
                            } else {
                              return null;
                            }
                          },
                        ),
                    ],
                  ),
                  verticalSpaceMedium,
                  TextLink(
                    'Create an Account if you\'re new.',
                    onPressed: () {
                        model.navigateToSignUp();
                    },
                  ),
                  verticalSpaceMedium,
                  FormBuilderCheckboxList(
            attribute: "favorite_ice_cream",
            
            options: [
              FormBuilderFieldOption(
                //child: Text("Vanilla"),
                value: "vanilla"
              ),
              FormBuilderFieldOption(
                //child: Text("Chocolate"),
                value: "chocolate"
              ),
              FormBuilderFieldOption(
                //child: Text("Strawberry"),
                value: "strawberry"
              ),
              FormBuilderFieldOption(
                //child: Text("Peach"),
                value: "peach"
              ),
            ],
            initialValue: "vanilla",
            leadingInput: true,

            onChanged: (value) {
             print("------------>: "+value);
            },
          ),
                ],
              ),
            ),
                      ),
          )),
    );
  }
}


