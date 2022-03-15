import 'package:flutter_grit/demo/http/joke_entity.dart';
import 'package:flutter_grit/generated/json/base/json_convert_content.dart';

JokeEntity $JokeEntityFromJson(Map<String, dynamic> json) {
	final JokeEntity jokeEntity = JokeEntity();
	final String? showapiResError = jsonConvert.convert<String>(json['showapi_res_error']);
	if (showapiResError != null) {
		jokeEntity.showapiResError = showapiResError;
	}
	final String? showapiResId = jsonConvert.convert<String>(json['showapi_res_id']);
	if (showapiResId != null) {
		jokeEntity.showapiResId = showapiResId;
	}
	final int? showapiResCode = jsonConvert.convert<int>(json['showapi_res_code']);
	if (showapiResCode != null) {
		jokeEntity.showapiResCode = showapiResCode;
	}
	final int? showapiFeeNum = jsonConvert.convert<int>(json['showapi_fee_num']);
	if (showapiFeeNum != null) {
		jokeEntity.showapiFeeNum = showapiFeeNum;
	}
	final JokeShowapiResBody? showapiResBody = jsonConvert.convert<JokeShowapiResBody>(json['showapi_res_body']);
	if (showapiResBody != null) {
		jokeEntity.showapiResBody = showapiResBody;
	}
	return jokeEntity;
}

Map<String, dynamic> $JokeEntityToJson(JokeEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	data['showapi_fee_num'] = entity.showapiFeeNum;
	data['showapi_res_body'] = entity.showapiResBody?.toJson();
	return data;
}

JokeShowapiResBody $JokeShowapiResBodyFromJson(Map<String, dynamic> json) {
	final JokeShowapiResBody jokeShowapiResBody = JokeShowapiResBody();
	final List<JokeShowapiResBodyContentlist>? contentlist = jsonConvert.convertListNotNull<JokeShowapiResBodyContentlist>(json['contentlist']);
	if (contentlist != null) {
		jokeShowapiResBody.contentlist = contentlist;
	}
	final int? maxResult = jsonConvert.convert<int>(json['maxResult']);
	if (maxResult != null) {
		jokeShowapiResBody.maxResult = maxResult;
	}
	final int? allNum = jsonConvert.convert<int>(json['allNum']);
	if (allNum != null) {
		jokeShowapiResBody.allNum = allNum;
	}
	final int? allPages = jsonConvert.convert<int>(json['allPages']);
	if (allPages != null) {
		jokeShowapiResBody.allPages = allPages;
	}
	final int? currentPage = jsonConvert.convert<int>(json['currentPage']);
	if (currentPage != null) {
		jokeShowapiResBody.currentPage = currentPage;
	}
	final int? retCode = jsonConvert.convert<int>(json['ret_code']);
	if (retCode != null) {
		jokeShowapiResBody.retCode = retCode;
	}
	return jokeShowapiResBody;
}

Map<String, dynamic> $JokeShowapiResBodyToJson(JokeShowapiResBody entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['contentlist'] =  entity.contentlist?.map((v) => v.toJson()).toList();
	data['maxResult'] = entity.maxResult;
	data['allNum'] = entity.allNum;
	data['allPages'] = entity.allPages;
	data['currentPage'] = entity.currentPage;
	data['ret_code'] = entity.retCode;
	return data;
}

JokeShowapiResBodyContentlist $JokeShowapiResBodyContentlistFromJson(Map<String, dynamic> json) {
	final JokeShowapiResBodyContentlist jokeShowapiResBodyContentlist = JokeShowapiResBodyContentlist();
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		jokeShowapiResBodyContentlist.type = type;
	}
	final String? img = jsonConvert.convert<String>(json['img']);
	if (img != null) {
		jokeShowapiResBodyContentlist.img = img;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		jokeShowapiResBodyContentlist.title = title;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		jokeShowapiResBodyContentlist.id = id;
	}
	final String? ct = jsonConvert.convert<String>(json['ct']);
	if (ct != null) {
		jokeShowapiResBodyContentlist.ct = ct;
	}
	return jokeShowapiResBodyContentlist;
}

Map<String, dynamic> $JokeShowapiResBodyContentlistToJson(JokeShowapiResBodyContentlist entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['img'] = entity.img;
	data['title'] = entity.title;
	data['id'] = entity.id;
	data['ct'] = entity.ct;
	return data;
}