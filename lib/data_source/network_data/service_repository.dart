import 'dart:io';

import 'package:lightproject/data_source/network_data/config/apisubdomain.dart';
import 'package:lightproject/data_source/network_data/config/network_response.dart';
import 'package:lightproject/data_source/network_data/config/restclient.dart';
import 'package:lightproject/data_source/network_data/interface/service_api_provider.dart';


class ServiceRepository with RestClient, ServiceApiProvider {
  @override
  Future<NetworkResponse?> updateFcm(String tokenFcm) async{
    dynamic body = {"fcm_token": tokenFcm, "os": Platform.isAndroid ? "android" : "ios"};
    await postAsyncWithToken(API.updateFCM, body: body);
  }

  
}


