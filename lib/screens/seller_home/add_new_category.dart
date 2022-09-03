import 'package:flutter/material.dart';

class AddNewCAtegory extends StatefulWidget {
  //AddNewCAtegory({Key? key}) : super(key: key);

  @override
  State<AddNewCAtegory> createState() => _AddNewCAtegoryState();
}

class _AddNewCAtegoryState extends State<AddNewCAtegory> {
  List<String> categoryList = ["Select Category", "Food", "Clothing", "Beauty"];
  String selectedCat = "Select Category";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.settings),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: TextFormField(
                        // controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          labelText: "Search products",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.notifications)
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[400],
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: size.height * 0.03),
              child: Text(
                "Add new category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: TextFormField(
              // controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: "Category name",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: DropdownButton<String>(
                value: selectedCat,
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
                    selectedCat = newValue;
                    print(newValue);
                  });
                },
                items:
                    categoryList.map<DropdownMenuItem<String>>((String value) {
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
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0, vertical: size.height * 0.02),
                child: Text("Add Categories"),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
            ),
          )
        ],
      ),
    ));
  }
}
