import 'dart:convert';

import 'package:advice_quote/models/advice_model.dart';
import 'package:advice_quote/network/api_manager.dart';
import 'package:advice_quote/network/api_uris.dart';
import 'package:advice_quote/network/base_result.dart';

class AdviceRepo {
  ApiManager apiManager = ApiManager();

  Future<Result<AdviceModel>> advice() async {
    try {
      final response = await apiManager.get(ApiUris.adviceUrl);
      if (response.statusCode == 200) {
        final advice = jsonDecode(response.data); //convert to jsonFormat

        final data = advice["slip"];

        final result = AdviceModel.fromJson(data);

        return Result.success(result);
      } else {
        return Result.failure('Api fetching failed');
      }
    } catch (e) {
      return Result.failure('An error occurred');
    }
  }
}
