import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/widgets/app_title.dart';
import '../widgets/mobile_input.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../utility/app_url.dart';
import '../screens/mobile_ver.dart';

class RegisterMobile extends StatefulWidget {
  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  String mobile;

  bool mobile_ver = true;
  var prefixVal= '';
  var mobVal= '';
 

  

 List prefix= [];
  Map json = {};

  Future<Map<String, dynamic>> getPrefix() async {
    var result;

    Response response = await Dio().get(AppUrl.getPrefix);

    if (response.statusCode == 200) {
      print('done-lists');
      print(response.data['data']);
      setState(() {
        prefix= response.data['data'];
      });
      
      print('prefixxxxxxxxxxxxx');
    print(prefix);
    } else {}

    return result;
  }

  void initState() {
    super.initState();
    getPrefix();
    
  }

  void getPrefixVal(val) {
    setState(() {
      prefixVal= val;
    });
    print(prefixVal);
  }

  void getMobVal(val) {
    setState(() {
      mobVal= val;
    });
    print(mobVal);
  }
  

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_img_santra.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
                scale: 0.7,
                child: AppTitle(),
              ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Lets get started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
                color: Color(0xFF265198),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MobileInput(prefix, getPrefixVal, getMobVal),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  auth.sendOtp(prefixVal.toString()+mobVal.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileVer(
                          mobile_register: true,
                        ),
                      ));
                },
                color: Color(0xFF265198),
                textColor: Colors.white,
                child: Text('Next'),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  'Already have an account ?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
