import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/providers/seller_provider.dart';
import 'package:flutter_login_regis_provider/widgets/custom_dropdown.dart';
import 'package:flutter_login_regis_provider/widgets/loading.dart';
import '../../widgets/input_decoration.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

class NewPromotion extends StatefulWidget {
  NewPromotion({Key key}) : super(key: key);

  @override
  State<NewPromotion> createState() => _NewPromotionState();
}

class _NewPromotionState extends State<NewPromotion> {
  final formKey = GlobalKey<FormState>();
  var promotion_name,
      promotion_type,
      promotion_description,
      promotion_expiry,
      promotion_value,
      promotion_start= '';

  @override
  Widget build(BuildContext context) {
    SellerProvider seller = Provider.of<SellerProvider>(context);
    Size size = MediaQuery.of(context).size;

    var addPromotion= () {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        seller.add_promotions(promotion_name, promotion_type, promotion_description, promotion_start, promotion_expiry, promotion_value).then((response) {
          print(response);
          if (response['status']) {
            Flushbar(
              title: 'Success!',
              message: response['message'],
              duration: Duration(seconds: 3),
            ).show(context);
          } else {
            Flushbar(
              title: 'Fail!',
              message: response['messsage'],
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      }
      else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    };

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
        child:
        Form(
          key: formKey,
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
                        validator: (value) =>
                            value.isEmpty ? 'Please enter promotion name' : null,
                        onSaved: (value) => promotion_name = value,
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
                    child: CustomDropdown(
                      null,
                      'Percentage/Amount',
                      ['a', 'b'],
                      (value) => promotion_type = value,
                    ),
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
                        validator: (value) =>
                            value.isEmpty ? 'Please enter description' : null,
                        autofocus: false,
                        onSaved: (value) => promotion_description = value,
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
                    child: Text('Start'),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Please enter start date' : null,
                        onSaved: (value) => promotion_expiry = promotion_start,
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
                    child: Text('Expiry'),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Please enter expiry date' : null,
                        onSaved: (value) => promotion_expiry = value,
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
                    child: CustomDropdown(
                        null, 'Percentage/Amount', ['a', 'b'], () {}),
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
                        validator: (value) =>
                            value.isEmpty ? 'Please enter amount' : null,
                        onSaved: (value) => promotion_value = value,
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
              child:
              seller.isLoading ?
                Loading() :
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.black),
                ),
                onPressed: () {
                  addPromotion();
                },
                child:
                Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        )
        
      ),
    );
  }
}
