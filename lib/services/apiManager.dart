import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/appDetails.dart';
import 'package:flutter_app/localDB/dbHelder.dart';
import 'package:flutter_app/model/OrderListItemDetails.dart';
import 'package:flutter_app/model/orderList.dart';
import 'package:http/http.dart' as http;

Future loginCheck(params) async {
  String url = (URLCONSTRAINT.base_url + URLCONSTRAINT.login_url);
  try {
    http.Response response = await http.post(url, body: params);
    print(response);
    print('Response Request ${response.request}');
    print('Response Status ${response.statusCode}');
    print('Response Body ${response.body}');
    var data = jsonDecode(response.body);
  } catch (e) {
    print(e.toString());
  }
}

Future getOrderList() async {
  OrderList orderList;

  String url = (URLCONSTRAINT.base_url + URLCONSTRAINT.orderList);
  try {
    http.Response response = await http.get(url);
    print(response);
    print('Response Request ${response.request}');
    print('Response Status ${response.statusCode}');
    print('Response Body ${response.body}');
    var data = jsonDecode(response.body);
    String message = data['message'].toString();
    String statusCode = data['status'].toString();
    if (response.body == null) {
      return null;
    } else if (statusCode.toString() == '200') {
      orderList = OrderList.fromJson(data);
      return orderList;
    } else {
      return 'fail';
    }
  } catch (e) {
    print(e.toString());
  }
}

Future getOrderItem({String ids}) async {
  OrderListItemDetails orderListItemDetails;
  String url = (URLCONSTRAINT.base_url +
      URLCONSTRAINT.orderItemDetails +
      ids.toString());

  try {
    http.Response response = await http.get(url);
    print(response);
    print('Response Request ${response.request}');
    print('Response Status ${response.statusCode}');
    print('Response Body ${response.body}');
    var data = jsonDecode(response.body);
    String message = data['message'].toString();
    String statusCode = data['status'].toString();
    if (response.body == null) {
      return 'test';
    } else if (statusCode.toString() == '200') {
      orderListItemDetails = OrderListItemDetails.fromJson(data);
      return orderListItemDetails;
    } else {
      return 'fail';
    }
  } catch (e) {
    print(e.toString());
  }
}
