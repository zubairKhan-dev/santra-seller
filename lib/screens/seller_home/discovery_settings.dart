import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/Constants/my_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DicscoverySettings extends StatefulWidget {
  DicscoverySettings({Key key}) : super(key: key);

  @override
  State<DicscoverySettings> createState() => _DicscoverySettingsState();
}

class _DicscoverySettingsState extends State<DicscoverySettings> {
  List optionList = ["Option 1", "Option 2", "option 3"];
  SfRangeValues slider_value = SfRangeValues(40.0, 50.0);
  List<String> stateList = ["Dubai", "Sharjah", "Abu Dhabi", "Ajman"];
  String selectedState = "Dubai";
  String selectedOption = "Option 1";
  bool availabilityStatus = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.prime,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.01, vertical: size.height * 0.04),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: SvgPicture.asset(
                      "assets/images/arrow_back.svg",
                      height: size.height * 0.03,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.015,
                        horizontal: size.width * 0.15),
                    child: const Text(
                      "Discovery Settings",
                      style: TextStyle(
                        fontSize: 20,
                        color: MyColors.second,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: size.height * 0.7,
            width: size.width * 1,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "I am",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * 0.4,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: FlutterSwitch(
                        activeColor: MyColors.prime,
                        width: size.width * 0.25,
                        activeText: "Available",
                        activeTextColor: Colors.white,
                        valueFontSize: 10,
                        showOnOff: true,
                        inactiveTextColor: Colors.white,
                        inactiveText: "Unavailable",
                        value: availabilityStatus,
                        onToggle: (val) {
                          setState(() {
                            availabilityStatus = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: size.height * 0.08,
                  color: MyColors.prime,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      "Delivery State",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          color: MyColors.prime,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: DropdownButton<String>(
                        value: selectedState,
                        icon: Expanded(
                          child: Row(
                            children: const [
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: MyColors.second,
                              ),
                            ],
                          ),
                        ),
                        elevation: 16,
                        underline: const SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            selectedState = newValue;
                            print(newValue);
                          });
                        },
                        items: stateList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                color: MyColors.second,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: size.height * 0.08,
                  color: MyColors.prime,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      "My Location",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          color: MyColors.prime,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: DropdownButton<String>(
                        value: selectedState,
                        icon: Expanded(
                          child: Row(
                            children: const [
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: MyColors.second,
                              ),
                            ],
                          ),
                        ),
                        elevation: 16,
                        underline: const SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            selectedState = newValue;
                            print(newValue);
                          });
                        },
                        items: stateList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                color: MyColors.second,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: size.height * 0.08,
                  color: MyColors.prime,
                  thickness: 1,
                ),
                Text(
                  "Min | Max Available Time(Minutes)",
                  style: TextStyle(color: MyColors.second),
                ),
                SfRangeSlider(
                  min: 0.0,
                  max: 60.0,
                  values: slider_value,
                  showLabels: true,
                  interval: 10,
                  activeColor: MyColors.prime,
                  onChanged: (SfRangeValues value) {
                    setState(() {
                      slider_value = value;
                      print(slider_value);
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
