

import '../../models/data_mo_entity.dart';
import 'base/json_convert_content.dart';

DataMoEntity $DataMoEntityFromJson(Map<String, dynamic> json) {
	final DataMoEntity dataMoEntity = DataMoEntity();
	final String? showapiResError = jsonConvert.convert<String>(json['showapi_res_error']);
	if (showapiResError != null) {
		dataMoEntity.showapiResError = showapiResError;
	}
	final String? showapiResId = jsonConvert.convert<String>(json['showapi_res_id']);
	if (showapiResId != null) {
		dataMoEntity.showapiResId = showapiResId;
	}
	final int? showapiResCode = jsonConvert.convert<int>(json['showapi_res_code']);
	if (showapiResCode != null) {
		dataMoEntity.showapiResCode = showapiResCode;
	}
	final int? showapiFeeNum = jsonConvert.convert<int>(json['showapi_fee_num']);
	if (showapiFeeNum != null) {
		dataMoEntity.showapiFeeNum = showapiFeeNum;
	}
	final DataMoShowapiResBody? showapiResBody = jsonConvert.convert<DataMoShowapiResBody>(json['showapi_res_body']);
	if (showapiResBody != null) {
		dataMoEntity.showapiResBody = showapiResBody;
	}
	return dataMoEntity;
}

Map<String, dynamic> $DataMoEntityToJson(DataMoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	data['showapi_fee_num'] = entity.showapiFeeNum;
	data['showapi_res_body'] = entity.showapiResBody?.toJson();
	return data;
}

DataMoShowapiResBody $DataMoShowapiResBodyFromJson(Map<String, dynamic> json) {
	final DataMoShowapiResBody dataMoShowapiResBody = DataMoShowapiResBody();
	final int? allPages = jsonConvert.convert<int>(json['allPages']);
	if (allPages != null) {
		dataMoShowapiResBody.allPages = allPages;
	}
	final int? maxResult = jsonConvert.convert<int>(json['maxResult']);
	if (maxResult != null) {
		dataMoShowapiResBody.maxResult = maxResult;
	}
	final int? currentPage = jsonConvert.convert<int>(json['currentPage']);
	if (currentPage != null) {
		dataMoShowapiResBody.currentPage = currentPage;
	}
	final int? retCode = jsonConvert.convert<int>(json['ret_code']);
	if (retCode != null) {
		dataMoShowapiResBody.retCode = retCode;
	}
	final List<DataMoShowapiResBodyContentlist>? contentlist = jsonConvert.convertListNotNull<DataMoShowapiResBodyContentlist>(json['contentlist']);
	if (contentlist != null) {
		dataMoShowapiResBody.contentlist = contentlist;
	}
	final int? allNum = jsonConvert.convert<int>(json['allNum']);
	if (allNum != null) {
		dataMoShowapiResBody.allNum = allNum;
	}
	return dataMoShowapiResBody;
}

Map<String, dynamic> $DataMoShowapiResBodyToJson(DataMoShowapiResBody entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['allPages'] = entity.allPages;
	data['maxResult'] = entity.maxResult;
	data['currentPage'] = entity.currentPage;
	data['ret_code'] = entity.retCode;
	data['contentlist'] =  entity.contentlist?.map((v) => v.toJson()).toList();
	data['allNum'] = entity.allNum;
	return data;
}

DataMoShowapiResBodyContentlist $DataMoShowapiResBodyContentlistFromJson(Map<String, dynamic> json) {
	final DataMoShowapiResBodyContentlist dataMoShowapiResBodyContentlist = DataMoShowapiResBodyContentlist();
	final String? ct = jsonConvert.convert<String>(json['ct']);
	if (ct != null) {
		dataMoShowapiResBodyContentlist.ct = ct;
	}
	final String? img = jsonConvert.convert<String>(json['img']);
	if (img != null) {
		dataMoShowapiResBodyContentlist.img = img;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		dataMoShowapiResBodyContentlist.id = id;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		dataMoShowapiResBodyContentlist.type = type;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		dataMoShowapiResBodyContentlist.title = title;
	}
	return dataMoShowapiResBodyContentlist;
}

Map<String, dynamic> $DataMoShowapiResBodyContentlistToJson(DataMoShowapiResBodyContentlist entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ct'] = entity.ct;
	data['img'] = entity.img;
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['title'] = entity.title;
	return data;
}