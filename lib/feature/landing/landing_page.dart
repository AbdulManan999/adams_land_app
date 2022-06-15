import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adams_land/common/constant/env.dart';
import 'package:adams_land/common/http/api_provider.dart';
import 'package:adams_land/common/util/internet_check.dart';
import 'package:adams_land/common/widget/loading_widget.dart';
import 'package:adams_land/feature/authentication/bloc/index.dart';
import 'package:adams_land/feature/landing/splash_page.dart';
import 'package:adams_land/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_screenutil/screen_util.dart';

import '../signin_signup/ui/screen/sign_in_page.dart';
import '../signin_signup/ui/screen/sign_up_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const LoadingWidget(
              visible: true,
            );
          }

          if (state is AuthenticationAuthenticated) {
            return SignUpPage(
                authRepository: AuthRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                        RepositoryProvider.of<InternetCheck>(context)));
          }
          if (state is AuthenticationUnauthenticated) {
            return SignInPage(
                authRepository: AuthRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                        RepositoryProvider.of<InternetCheck>(context)));
            // return LoginScreen();
          }

          return SplashPage();
        });
  }
}
