import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/screens/seller_home/bottom.dart';
import 'package:flutter_login_regis_provider/widgets/add_new_product_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../providers/seller_provider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flushbar/flushbar.dart';

import '../../Constants/my_colors.dart';

class AddImageAndVideosOfProduct extends StatefulWidget {
  const AddImageAndVideosOfProduct({Key key}) : super(key: key);

  @override
  State<AddImageAndVideosOfProduct> createState() =>
      _AddImageAndVideosOfProductState();
}

class _AddImageAndVideosOfProductState extends State<AddImageAndVideosOfProduct> {

  // user image picker function
  filePick() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      var im = images_;
      print(result.files.single.path);
      im.add(result.files.single.path);
      setState(() {
        images_ = im;
      });
      print(images_);
      File file = File(result.files.single.path);
      List<int> fileInByte = file.readAsBytesSync();
      String fileInBase64 = base64Encode(fileInByte); //converting to base64
      print('file in base 64');
      print(fileInBase64);
      var im_ = images;
      im_.add(fileInBase64);
      setState(() {
        images = im_;
      });
      return fileInBase64;
    } else {
      // User canceled the picker
    }
  }

  //user video picker function
  videoPick() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      List<int> fileInByte = file.readAsBytesSync();
      String fileInBase64 = base64Encode(fileInByte); // converting to base 64
      print('video in base 64');
      print(fileInBase64);
      var im_ = videos;
      im_.add(fileInBase64);
      setState(() {
        videos = im_;
      });
    } else {
      // User canceled the picker
    }
  }

  List images_ = []; // list of images shown in ui
  List images = []; // list of images send as payload
  List videos = []; // list of videos send as payload
  var ylink = ''; // youtube link

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SellerProvider seller = Provider.of<SellerProvider>(context);

    var image_1 = images.length > 0 ? images[0] : '';
    var image_2 = images.length > 1 ? images[1] : '';
    var image_3 = images.length > 2 ? images[2] : '';
    var image_4 = images.length > 3 ? images[3] : '';
    var image_5 = images.length > 4 ? images[4] : '';
    var video_1 = videos.length > 0 ? videos[0] : '';
    var video_2 = videos.length > 1 ? videos[1] : '';
    var video_3 = videos.length > 2 ? videos[2] : '';

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator(), Text("Please wait...")],
    );

    var addVisuals = () async {
      if (images.length > 0 && videos.length > 0) {
        seller
            .add_products_images_videos(ylink, image_1, image_2, image_3,
                image_4, image_5, video_1, video_2, video_3)
            .then((response) {
          if (response['status']) {
            Flushbar(
              //title: 'Success',
              message: 'Sucess',
              duration: Duration(seconds: 3),
            ).show(context);
          } else {
            Flushbar(
              //title: 'Failed',
              message: 'Failed',
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      }
      else {
        Flushbar(
              title: 'Failed',
              message: 'Please add product images and videos',
              duration: Duration(seconds: 3),
            ).show(context);
      }
    };

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottom(),
      backgroundColor: MyColors.prime,
      body: Container(
        child: Column(
          children: [
            AddNewProductHeader(),
            Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Add Images",
                              style: TextStyle(
                                  fontSize: 20, color: MyColors.secondLite),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/add_pictures_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.prime)),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: GestureDetector(
                                          onTap: () => filePick(),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Add Pictures",
                                                  style: TextStyle(
                                                    color: MyColors.second,
                                                  )),
                                              Spacer(),
                                              Container(
                                                width: size.width * 0.18,
                                                child: Row(
                                                  children: [
                                                    Text("Upload",
                                                        style: TextStyle(
                                                          color:
                                                              MyColors.second,
                                                        )),
                                                    Expanded(
                                                      child: SvgPicture.asset(
                                                        "assets/images/arrow_up_icon.svg",
                                                        height: 10,
                                                        color:
                                                            MyColors.secondLite,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.12),
                            child: Text(
                              "You can upload upto 5 Images",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: images_.length,
                                itemBuilder: (context, index) {
                                  var val = images_[index];
                                  return Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                      File(val),
                                      fit: BoxFit.contain,
                                    ),
                                  ));
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1),
                            child: Divider(
                              height: size.height * 0.1,
                              color: MyColors.prime,
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Add Videos",
                              style: TextStyle(
                                  fontSize: 20, color: MyColors.secondLite),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              videoPick();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/add_video_icon.svg",
                                    color: MyColors.secondLite,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.prime)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Add Videos",
                                              style: TextStyle(
                                                color: MyColors.second,
                                              )),
                                          Spacer(),
                                          Container(
                                            width: size.width * 0.18,
                                            child: Row(
                                              children: [
                                                Text("Upload",
                                                    style: TextStyle(
                                                      color: MyColors.second,
                                                    )),
                                                Expanded(
                                                  child: SvgPicture.asset(
                                                    "assets/images/arrow_up_icon.svg",
                                                    height: 10,
                                                    color: MyColors.secondLite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.12),
                            child: Text(
                              "You can upload upto 3 Videos",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {

                          //   },
                          //   child: Container(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 5, horizontal: 10),
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       children: [
                          //         SvgPicture.asset(
                          //           "assets/images/add_video_icon.svg",
                          //           color: MyColors.secondLite,
                          //         ),
                          //         SizedBox(
                          //           width: 5,
                          //         ),
                          //         Expanded(
                          //             child: Container(
                          //           decoration: BoxDecoration(
                          //             border: Border(
                          //                 bottom: BorderSide(
                          //                     color: MyColors.prime)),
                          //           ),
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 8.0),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Text("Add Video Link",
                          //                     style: TextStyle(
                          //                       color: MyColors.second,
                          //                     )),

                          //               ],
                          //             ),
                          //           ),
                          //         )),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                  onTap: () {
                                    addVisuals();
                                  },
                                  child: seller.isLoading
                                      ? loading
                                      : Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: MyColors.secondLite,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "Add Product",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        )))
                        ])))
          ],
        ),
      ),
    ));
  }
}
