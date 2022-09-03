import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'contact_santra.dart';

class RejectOrder extends StatefulWidget {
  const RejectOrder({ key}) : super(key: key);

  @override
  State<RejectOrder> createState() => _RejectOrderState();
}

class _RejectOrderState extends State<RejectOrder> {
  List<String> orderRejectionReasons = [
    "Select reason",
    "Reason 1",
    "Reason 2",
    "Reason 3",
    "Reason 4"
  ];
  String selectedReason = "Select reason";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final space = SizedBox(height: 10);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: (const Icon(Icons.arrow_back_ios)),
                ),
                Expanded(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.015),
                      child: const Text(
                        "Reject Order",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: selectedReason,
                        icon: Expanded(
                          child: Row(
                            children: const [
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                        elevation: 16,
                        underline: const SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            selectedReason = newValue;
                            print(newValue);
                          });
                        },
                        items: orderRejectionReasons
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontFamily: "Raleway Reg"),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  //  controller: passwordController,
                  enableSuggestions: false,
                  // key: const ValueKey("password"),
                  decoration: InputDecoration(
                    labelText: "Comments",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Reject Order"),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.to(() => const ContactSantra());
                          },
                          icon: const Icon(Icons.alternate_email),
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.01),
                            child: const Text("Contact Santra"),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _makePhoneCall("08909989900");
                          },
                          icon: const Icon(Icons.call),
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01,
                                vertical: size.height * 0.02),
                            child: const Text("Call Santra"),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // final Uri launchUri = Uri(
    //   scheme: 'tel',
    //   path: phoneNumber,
    // );
    // await launchUrl(launchUri);
  }
}
