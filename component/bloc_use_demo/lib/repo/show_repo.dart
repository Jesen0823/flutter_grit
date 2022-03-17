import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_mo_entity.dart';

class ShowRepo {

  Future<List<DataMoShowapiResBodyContentlist>?> requestShowData() async{
    String url = "http://route.showapi.com/341-2?showapi_appid=933775&showapi_sign=ff8e0e3b0b614f769c52af8378feabd5";
    final result = await http.Client().get(Uri.parse(url));
    if(result.statusCode != 200){
      return null;
    }else{
      final responseBody = json.decode(result.body);
      DataMoEntity entity = DataMoEntity.fromJson(responseBody);
      return entity.showapiResBody?.contentlist;
    }
  }


}