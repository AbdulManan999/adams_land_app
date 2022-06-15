import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adams_land/app/app.dart';
import 'package:adams_land/common/bloc/simple_bloc_delegate.dart';
import 'package:adams_land/common/constant/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(App(env: EnvValue.development));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}
