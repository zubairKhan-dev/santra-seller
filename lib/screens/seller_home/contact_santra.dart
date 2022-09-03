import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSantra extends StatelessWidget {
  const ContactSantra({ key}) : super(key: key);

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
                        "Contact Santra",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //  controller: passwordController,
                    enableSuggestions: false,
                    // key: const ValueKey("password"),
                    decoration: InputDecoration(
                      labelText: "Full name",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  space,
                  TextFormField(
                    //  controller: passwordController,
                    enableSuggestions: false,
                    // key: const ValueKey("password"),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email address",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  space,
                  TextFormField(
                    //  controller: passwordController,
                    enableSuggestions: false,
                    // key: const ValueKey("password"),
                    decoration: InputDecoration(
                      labelText: "Subject",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  space,
                  TextFormField(
                    maxLines: 3,
                    //  controller: passwordController,
                    enableSuggestions: false,
                    // key: const ValueKey("password"),
                    decoration: InputDecoration(
                      labelText: "Message",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  space,
                  space,
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Send Message"),
                      style: ElevatedButton.styleFrom(primary: Colors.teal))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
