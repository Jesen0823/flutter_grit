import 'dart:convert';

import 'package:flutter_grit/generated/json/base/json_field.dart';
import 'package:flutter_grit/generated/json/joke_entity.g.dart';
// api:  http://route.showapi.com/341-2?showapi_appid=933775&page=1&maxResult=30&showapi_sign=ff8e0e3b0b614f769c52af8378feabd5
@JsonSerializable()
class JokeEntity {

	@JSONField(name: "showapi_res_error")
	String? showapiResError;
	@JSONField(name: "showapi_res_id")
	String? showapiResId;
	@JSONField(name: "showapi_res_code")
	int? showapiResCode;
	@JSONField(name: "showapi_fee_num")
	int? showapiFeeNum;
	@JSONField(name: "showapi_res_body")
	JokeShowapiResBody? showapiResBody;
  
  JokeEntity();

  factory JokeEntity.fromJson(Map<String, dynamic> json) => $JokeEntityFromJson(json);

  Map<String, dynamic> toJson() => $JokeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JokeShowapiResBody {

	List<JokeShowapiResBodyContentlist>? contentlist;
	int? maxResult;
	int? allNum;
	int? allPages;
	int? currentPage;
	@JSONField(name: "ret_code")
	int? retCode;

  JokeShowapiResBody();

  factory JokeShowapiResBody.fromJson(Map<String, dynamic> json) => $JokeShowapiResBodyFromJson(json);

  Map<String, dynamic> toJson() => $JokeShowapiResBodyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JokeShowapiResBodyContentlist {

	int? type;
	String? img;
	String? title;
	String? id;
	String? ct;

  JokeShowapiResBodyContentlist();

  factory JokeShowapiResBodyContentlist.fromJson(Map<String, dynamic> json) => $JokeShowapiResBodyContentlistFromJson(json);

  Map<String, dynamic> toJson() => $JokeShowapiResBodyContentlistToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}