import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './contact_santra.dart';
//import 'package:url_launcher/link.dart';
//import 'package:url_launcher/url_launcher.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        "Order Accepted",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.person)),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Customer name",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Order Time",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text("+098765456789",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Order# :123",
                                      style: TextStyle(color: Colors.grey)),
                                  Text("Business Bay",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text("1"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.person)),
                            ),
                            Text("Item $index"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Text("Item Comments will go here"),
                            )
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Order special instructions will go here"),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Sub Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "AED 17.90",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "VAT",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "5%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Discount",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "AED 10.90",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Delivery charges",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "AED 10.90",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "AED 69.90",
                              style: TextStyle(fontWeight: FontWeight.bold),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "Time to prepare",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "30 min 30 secs",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Get.to(() => const ContactSantra());
                    },
                    icon: const Icon(Icons.alternate_email),
                    label: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.01),
                      child: const Text("Contact Santra"),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ),
                const SizedBox(width: 20),
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
    ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // final Uri launchUri = Uri(
    //   scheme: 'tel',
    //   path: phoneNumber,
    // );
    // //await launchUrl(launchUri);
  }
}
