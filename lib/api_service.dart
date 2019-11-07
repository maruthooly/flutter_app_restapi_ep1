//connect sevice for activety  have request and response
import 'package:http/http.dart' as http;
import 'user.dart';
import 'dart:convert';
import 'dart:io';

Future<List<User>> getAllUser() async{
  //request to service and response
  final response = await http.get(
    Uri.encodeFull('https://jsonplaceholder.typicode.com/users'),
    headers: {'Content-Type':'appllication/json'},
  );

  //check responese and encode to usei in app
  if(response.statusCode == 200){
    final  response_data = json.decode(response.body);
    final user_data = await response_data.map<User>((json){
      return User.fromJson(json);
  }).toList();
    return user_data;
  }else{
    //เเสดงเเจ้งเตือน
    throw Exception('Fail to connect service');
  }
}

