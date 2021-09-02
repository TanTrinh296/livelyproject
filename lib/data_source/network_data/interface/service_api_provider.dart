
import 'package:lightproject/data_source/network_data/config/network_response.dart';

abstract class ServiceApiProvider {
  Future<NetworkResponse?> updateFcm(String tokenFcm);
}
