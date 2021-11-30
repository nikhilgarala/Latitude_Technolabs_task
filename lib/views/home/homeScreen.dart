import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/localDB/dbHelder.dart';
import 'package:flutter_app/model/orderList.dart';
import 'package:flutter_app/services/apiManager.dart';
import 'package:flutter_app/views/vieworderDetails/viewOrderDetails.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  double screenHeight, screenWidth;

  @override
  void initState() {
    check().then((intenet) {
      if (intenet != null && intenet) {
        getProductData();
      }else {
        _refreshJournals();
      }
    });
    getProductData();
    super.initState();
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  OrderList orderList;

  getProductData() async {
    EasyLoading.show();
    await getOrderList().then((value) {
      debugPrint('GetOrderList Response ${value.toString()}');
      EasyLoading.dismiss();
      if (value != null) {
        if (value != 'fail') {
          setState(() {
            orderList = value;
          });
          insertData();
        }
      }
    });
  }

  insertData() async {
    for (int i = 0; i < orderList.data.length; i++) {
      var data = await SQLHelper.createItem(
        orderList.data[i].title.toString(),
        orderList.data[i].offerMedia[0].storageName.toString(),
        orderList.data[i].estimatedPrice.toString(),
        orderList.data[i].id,
      );
      debugPrint('1-1-1-1-1-1 Respomse ${data.toString()}');
    }
  }

  final TextEditingController _searchController = TextEditingController();
  bool isLocalDataUse = false;
  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    setState(() {
      isLocalDataUse = true;
    });
    debugPrint('GetData From Local ');
    final data = await SQLHelper.getItems();
    debugPrint('2-2-2-2-2- Local ${data.toString()}');
    setState(() {
      _journals = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('2-2-2-2-2-2 ${isLocalDataUse.toString()}');
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              hintText: 'search in Offers',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: EdgeInsets.zero,
            ),
            controller: _searchController,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: (isLocalDataUse == true ||
                    (orderList.toString().isNotEmpty &&
                        orderList.toString() != null &&
                        orderList.toString() != 'null'))
                ? Expanded(
                    child: (isLocalDataUse != true)
                        ? GridView.builder(
                            itemCount: orderList.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(20),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 250,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => viewOrderDetails(
                                      orderID: orderList.data[index].id,
                                    ),
                                  ),
                                ),
                                child: Card(
                                  shadowColor: Colors.grey,
                                  elevation: 5.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              10.0,
                                            ),
                                            topRight: Radius.circular(10.0),
                                          ),
                                          child: Image.network(
                                            'https://refreeapp.com/dev/public/uploads/offer/${orderList.data[index].offerMedia[0].storageName.toString()}',
                                            height: 120,
                                            width: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 3.0, right: 3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  '${orderList.data[index].title}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                width: 80.0,
                                              ),
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                width: 55.0,
                                                child: Text(
                                                  '₹ ${orderList.data[index].estimatedPrice.toString()}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              );
                            },
                          )
                        : GridView.builder(
                            itemCount: _journals.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(20),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 250,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => viewOrderDetails(
                                      orderID: _journals[index]['id'],
                                    ),
                                  ),
                                ),
                                child: Card(
                                  shadowColor: Colors.grey,
                                  elevation: 5.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              10.0,
                                            ),
                                            topRight: Radius.circular(10.0),
                                          ),
                                          child: Image.asset(
                                            'assets/noimg.jpg',
                                            height: 120,
                                            width: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 3.0, right: 3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  '${_journals[index]['title']}',
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                width: 80.0,
                                              ),
                                              Container(
                                                alignment: Alignment.centerRight,
                                                width: 55.0,
                                                child: Text(
                                                  '₹ ${_journals[index]['price']}',
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              );
                              // return Text(_journals[index][].toString());
                            },
                          ),
                  )
                : Container(

                  ),
          ),
        ),
      ),
    );
  }
}
