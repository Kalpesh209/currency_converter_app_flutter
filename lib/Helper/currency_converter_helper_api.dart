import 'dart:convert';

import 'package:currency_converter_app_flutter/AppUtils/app_constants.dart';
import 'package:currency_converter_app_flutter/Models/currency_converter_model.dart';
import 'package:http/http.dart' as http;

/*
Title:CurrencyConvertHelperAPI 
Purpose:CurrencyConvertHelperAPI
Created On: 03/09/2023
Edited On:03/09/2023
Author: Kalpesh Khandla
*/

class CurrencyConvertHelperAPI {
  CurrencyConvertHelperAPI._();

  static final CurrencyConvertHelperAPI currencyAPI =
      CurrencyConvertHelperAPI._();

  Future<CurrencyConvertModel?> currencyConvertorAPI({
    required String from,
    required String to,
    required int amt,
  }) async {
    String url = "${AppConstants.baseURL}from=$from&to=$to&amount=$amt";
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      print(decodedData);

      CurrencyConvertModel currencyConvertModel =
          CurrencyConvertModel.fromJSON(json: decodedData);

      print(currencyConvertModel);
      return currencyConvertModel;
    } else {
      return null;
    }
    //
  }
}
