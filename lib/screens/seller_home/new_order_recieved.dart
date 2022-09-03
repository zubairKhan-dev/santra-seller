import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './order_accepted.dart';
import './reject_order.dart';

class NewOrderRecieved extends StatelessWidget {
  const NewOrderRecieved({key}) : super(key: key);

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
                        "New order from ABC",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sub Total: 100 AED",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Promotion: 20%",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Total: 80 AED",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderAccepted(),
                            ));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.02),
                      child: const Text("Accept"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RejectOrder(),
                            ));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.02),
                      child: const Text("Reject"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
