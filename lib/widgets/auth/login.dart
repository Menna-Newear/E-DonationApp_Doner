import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/constants/validateAuth.dart';
import 'package:e_donation_app_doner/screens/bottomNavigationBar/bottomBarScreen.dart';
import 'package:e_donation_app_doner/widgets/auth/forgot_password.dart';
import 'package:e_donation_app_doner/widgets/auth/registerView.dart';
import 'package:e_donation_app_doner/widgets/customAlertDialogMethod%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routName = '/login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool _isLoading = false;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Focus Nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      try {
        setState(() {
          _isLoading = true;
        });

        await auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
        if (!mounted) {
          return;
        }
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
      } on FirebaseAuthException catch (error) {
        await CustomAlertDialoge.showErrorORWarningDialog(
          context: context,
          errMessage: "An error has been occured ${error.message}",
          fn: () {},
          image: 'assets/images/persons/sad_person.png',
        );
      } catch (error) {
        await CustomAlertDialoge.showErrorORWarningDialog(
          context: context,
          errMessage: "An error has been occured $error",
          fn: () {},
          image: 'assets/images/persons/sad_person.png',
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppConstant.logo)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Welcome",
                        style: FontsStyles.teststyle28
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    const Text(
                      "Please enter your data to continue",
                      style: FontsStyles.teststyle15,
                    ),
                    const GutterLarge(),
                    const GutterLarge(),
                    const GutterLarge(),
                    const GutterLarge(),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email address",
                        labelText: "Email address",
                      ),
                      validator: (value) {
                        return AuthValidator.emailValidator(value);
                      },
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                    ),
                    const Gutter(),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: "*********",
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        return AuthValidator.passwordValidator(value);
                      },
                      onFieldSubmitted: (value) {
                        _loginFct();
                      },
                    ),
                    const Gutter(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ForgotPasswordScreen.routeName);
                        },
                        child: Text(
                          "Forget Password?",
                          style: FontsStyles.teststyle15
                              .copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    const GutterLarge(),
                    TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onPressed: () {
                          _loginFct();
                        },
                        child: const Text(
                          "Sign In",
                          style: FontsStyles.teststyle17,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Hava Account ",
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routName);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
