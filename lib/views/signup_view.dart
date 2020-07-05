import 'package:deefirstapp/viewmodels/signup_view_model.dart';
import 'package:deefirstapp/widgets/text_link.dart';
import 'package:flutter/material.dart';
import '../shared/ui_helpers.dart';
//import '../widgets/busy_button.dart';
//import '../widgets/expansion_list.dart';
//import '../widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final String emailValue='';
  final String passwordValue='';
  final String firstNameValue='';

  @override
  Widget build(BuildContext context) {
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
                  
                  verticalSpaceLarge,
                  FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: "First Name",
                          decoration: InputDecoration(labelText: "Name"),
                          controller: firstNameController,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "First name cannot be empty"),
                            FormBuilderValidators.minLength(2),
                          ],
                        ),
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
                        child: Text("Sign up"),
                        onPressed: () {
                          if (_fbKey.currentState.validate()) {
                            model.signUp(
                                email: emailController.text.trim().toLowerCase(),
                                password: passwordController.text,
                                firstname: firstNameController.text
                                    .trim()
                                    .toLowerCase(),
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
                      
                    'Go to SignIn Page.',
                    onPressed: () {
                      model.navigateToSignIn();
                    },
                  ), 
                    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
