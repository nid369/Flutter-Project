import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  String url;

   Future getData() async{
      http.Response response = 
      await http.get(url);
      //print(response);
      if(response.statusCode == 200){
        //  String data = response.body;
          print(jsonDecode(response.body));
         return jsonDecode(response.body);
      }else{
        print(response.statusCode);
         }

   }
}