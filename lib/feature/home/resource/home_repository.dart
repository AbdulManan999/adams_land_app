import 'package:adams_land/common/constant/env.dart';
import 'package:adams_land/common/http/api_provider.dart';
import 'package:adams_land/common/http/response.dart';
import 'package:adams_land/common/util/internet_check.dart';
import 'package:meta/meta.dart';

import 'home_api_provider.dart';

class HomeRepository {
  ApiProvider apiProvider;
  HomeApiProvider homeApiProvider;
  InternetCheck internetCheck;
  Env env;

  HomeRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    homeApiProvider =
        HomeApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }
}
