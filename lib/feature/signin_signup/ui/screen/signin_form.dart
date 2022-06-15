import 'package:adams_land/common/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adams_land/common/route/routes.dart';
import 'package:adams_land/feature/signin_signup/bloc/index.dart';
import 'package:adams_land/feature/signin_signup/resources/index.dart';
import 'package:adams_land/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/size_extension.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final double screenSize = 750.h;

  void _onLoginButtonPressed() {
    BlocProvider.of<SignInBloc>(context).add(
      SignInButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // color: Provider.of<ThemeProvider>(context).getTheme()
                //     ? darkThemeBackgroundColor
                //     : backgroundColor,
                color: Colors.white,
                height: screenSize,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 290.w,
                      height: 80.h,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 18.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            state is SignInLoading
                                ? LoadingWidget(
                                    visible: true,
                                  )
                                : _signInButton(state),
                            SizedBox(
                              height: 16.h,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signInButton(SignInState state) {
    return Container(
      height: 50.h,
      child: ElevatedButton(
        //5A8DEE
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF5A8DEE),
        ),
        onPressed: state is SignInLoading ? null : _onLoginButtonPressed,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Icon(FontAwesomeIcons.arrowRight),
          ],
        ),
      ),
    );
    // return SizedBox(
    //     width: double.infinity,
    //     child: RaisedButton(
    //       color: Colors.white,
    //       onPressed: state is! SignInLoading ? _onLoginButtonPressed : null,
    //       child: Text(S.of(context).sign_in),
    //     ));
  }

  Widget _signUpButton() {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, Routes.signUp,
                arguments: RepositoryProvider.of<AuthRepository>(context));
          },
          child: Text(S.of(context).sign_up),
        ));
  }
}
