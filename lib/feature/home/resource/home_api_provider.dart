import 'dart:async';

import 'package:adams_land/common/http/api_provider.dart';
import 'package:meta/meta.dart';

class HomeApiProvider {
  final ApiProvider apiProvider;
  final String baseUrl;
  HomeApiProvider({@required this.baseUrl, @required this.apiProvider});
}
