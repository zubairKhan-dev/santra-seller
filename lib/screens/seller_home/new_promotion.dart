import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import '../../widgets/input_decoration.dart';

class NewPromotion extends StatefulWidget {
  NewPromotion({Key key}) : super(key: key);

  @override
  State<NewPromotion> createState() => _NewPromotionState();
}

class _NewPromotionState extends State<NewPromotion> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Promotion',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Name'),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextFormField(
                        autofocus: false,
                        decoration: customInputDecoration(
                            "Ingredients", Icons.food_bank),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Type'),
                  ),
                  Expanded(
                    flex: 4,
                    child:
                        CustomDropdown(null, 'Percentage/Amount', ['a', 'b']),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Description'),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Enter Description here',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Expiry'),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextFormField(
                        autofocus: false,
                        decoration:
                            customInputDecoration("/ /", Icons.calendar_month),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Category'),
                  ),
                  Expanded(
                    flex: 4,
                    child:
                        CustomDropdown(null, 'Percentage/Amount', ['a', 'b']),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Amount'),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextFormField(
                          autofocus: false,
                          decoration:
                              customInputDecoration("20", Icons.money))),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.black),
               
                ),
                onPressed: () {},
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
