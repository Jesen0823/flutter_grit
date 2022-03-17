import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/data_mo_entity.g.dart';


@JsonSerializable()
class DataMoEntity {

	@JSONField(name: "showapi_res_error")
	String? showapiResError;
	@JSONField(name: "showapi_res_id")
	String? showapiResId;
	@JSONField(name: "showapi_res_code")
	int? showapiResCode;
	@JSONField(name: "showapi_fee_num")
	int? showapiFeeNum;
	@JSONField(name: "showapi_res_body")
	DataMoShowapiResBody? showapiResBody;
  
  DataMoEntity();

  factory DataMoEntity.fromJson(Map<String, dynamic> json) => $DataMoEntityFromJson(json);

  Map<String, dynamic> toJson() => $DataMoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DataMoShowapiResBody {

	int? allPages;
	int? maxResult;
	int? currentPage;
	@JSONField(name: "ret_code")
	int? retCode;
	List<DataMoShowapiResBodyContentlist>? contentlist;
	int? allNum;
  
  DataMoShowapiResBody();

  factory DataMoShowapiResBody.fromJson(Map<String, dynamic> json) => $DataMoShowapiResBodyFromJson(json);

  Map<String, dynamic> toJson() => $DataMoShowapiResBodyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DataMoShowapiResBodyContentlist {

	String? ct;
	String? img;
	String? id;
	int? type;
	String? title;
  
  DataMoShowapiResBodyContentlist();

  factory DataMoShowapiResBodyContentlist.fromJson(Map<String, dynamic> json) => $DataMoShowapiResBodyContentlistFromJson(json);

  Map<String, dynamic> toJson() => $DataMoShowapiResBodyContentlistToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}