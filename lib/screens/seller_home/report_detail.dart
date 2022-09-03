import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/track_order.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

class ReportDetail extends StatefulWidget {
  ReportDetail({Key key}) : super(key: key);

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  var list = ["one", "two", "three", "four", "five", "six", "seven", "eight"];
  final List _categories = ['Food', 'Clothing', 'Beauty'];

  CalendarFormat _calendarFormat = CalendarFormat.week;

  _showBottomModal(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Container(
            //height: 500,
            color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                  )
                ],
              ),
              alignment: Alignment.topLeft,
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [Icon(Icons.filter_alt), Text('Filter')],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:
                                  CustomDropdown(Icons.abc, 'Select Category', _categories),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  CustomDropdown(Icons.abc, 'Select Category', _categories),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: CustomDropdown(Icons.abc, 'Payment Method', _categories),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {Navigator.pop(context);},
                      color: Colors.grey,
                      textColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Search'),
                      ),
                      disabledColor: Colors.black12,
                      disabledTextColor: Colors.blueGrey,

                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Report Details'),
          backgroundColor: Colors.grey,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.filter_alt),
                onPressed: () {
                  _showBottomModal(context);
                }),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  calendarFormat: _calendarFormat,
                ),
              ),
              for (var item in list)
                Container(
                  //color: Colors.grey,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.5,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order #'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('123'),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrackOrder(),
                                      ));
                                },
                                child: Text(
                                  'Track Order',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Customer Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Total Amount ' + ' 2000 AED',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 114, 113, 113)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add_card),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.add_a_photo_outlined),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.emoji_emotions),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(Icons.access_alarm),
                                            Text(
                                              '+ 3 more items',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )),
        ));
  }
}
