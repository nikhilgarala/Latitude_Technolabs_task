import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/localDB/dbHelder.dart';
import 'package:flutter_app/model/OrderListItemDetails.dart';
import 'package:flutter_app/services/apiManager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class viewOrderDetails extends StatefulWidget {
  int orderID;

  viewOrderDetails({this.orderID});

  @override
  viewOrderDetailsState createState() => viewOrderDetailsState();
}

class viewOrderDetailsState extends State<viewOrderDetails> {
  double screenHeight, screenWidth;
  OrderListItemDetails orderListItemDetails;

  List<Map<String, dynamic>> _journals = [];

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  bool isLocalDataUse = false;

  void _refreshJournals() async {
    setState(() {
      isLocalDataUse = true;
    });
    debugPrint('GetData From Local Order Details ');
    final data = await SQLHelper.getOrderItemDetailsRecord(widget.orderID);
    debugPrint('2-2-2-2-2- Local ${data.toString()}');
    if (data.toString().isNotEmpty &&
        data.toString() != null &&
        data.toString() != 'null') {
      setState(() {
        _journals = data;
        isLocalDataUse = true;
      });
    }
    if(_journals.isEmpty || _journals.length <=0)
    {
      Fluttertoast.showToast(
        msg: 'No order Details found',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  viewOrderListDetails() async {
    EasyLoading.show();
    await getOrderItem(ids: widget.orderID.toString()).then((value) {
      debugPrint('OrderItem Details ${value.toString()}');
      EasyLoading.dismiss();
      if (value != null) {
        if (value != 'fail') {
          setState(() {
            orderListItemDetails = value;
          });
          storeOrderData();
        }
      }
    });
  }

  storeOrderData() async {
    for (int i = 0; i < orderListItemDetails.data.length; i++) {
      var data = await SQLHelper.createOrderDetailItem(
          ids: orderListItemDetails.data[i].id,
          title: orderListItemDetails.data[i].title.toString(),
          price: orderListItemDetails.data[i].estimatedPrice.toString(),
          address: orderListItemDetails.data[i].address.toString(),
          category: orderListItemDetails.data[i].category.toString());
      debugPrint('1-1-1-1-1-1 Respomse ${data.toString()}');
    }
  }

  @override
  void initState() {
    check().then((intenet) {
      if (intenet != null && intenet) {
        viewOrderListDetails();
      } else {
        _refreshJournals();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('1-1-1-1-1 ORderOD ${widget.orderID}');
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 5.0, right: 8.0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ButtonTheme(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.green),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    '+Wishlist',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ButtonTheme(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.green),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            ButtonTheme(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.green),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Text(
                  'Share',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_time),
          )
        ],
      ),
      body: (isLocalDataUse == true ||
              (orderListItemDetails.toString().isNotEmpty &&
                  orderListItemDetails.toString() != null &&
                  orderListItemDetails.toString() != 'null'))
          ? SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: (isLocalDataUse != true)
                                  ? NetworkImage(
                                      'https://refreeapp.com/dev/public/uploads/offer/${orderListItemDetails.data[0].offerMedia[0].storageName.toString()}')
                                  : AssetImage('assets/noimg.jpg'),
                              fit: BoxFit.cover),
                        ),
                        height: screenHeight / 2.5,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Category : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  (isLocalDataUse != true)
                                      ? '${orderListItemDetails.data[0].category.title}'
                                      : _journals[0]['category'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Title : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  (isLocalDataUse != true)
                                      ? '${orderListItemDetails.data[0].title}'
                                      : '${_journals[0]['title']}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  (isLocalDataUse != true)
                                      ? '${orderListItemDetails.data[0].estimatedPrice}'
                                      : _journals[0]['price'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Address : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  (isLocalDataUse != true)
                                      ? '${orderListItemDetails.data[0].address}'
                                      : _journals[0]['address'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
