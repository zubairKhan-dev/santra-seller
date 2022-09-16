
class User {
  String userId;
  // String name;
  // String email;
  // String phone;
  // String type;
  // String token;
  // String renewalToken;

  User({this.userId,
   //this.name, this.email, this.phone, this.type, this.token,this.renewalToken
   });

  // now create converter

 factory User.fromJson(List<dynamic> responseData){
  print('askdh');
  print(responseData[0]['seller_code']);
   return User(
     userId: responseData[0]['seller_code'],
    //  name: responseData['Username'],
    //  email : responseData['Email'],
    //  phone: responseData['phone'],
    //  type : responseData['type'],
    //  token: responseData['token'],
    //  renewalToken : responseData['token'],
     
   );
 }
}