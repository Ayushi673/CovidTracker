import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19/models/countryModel.dart';

class WorldData{
  static const String url= 'https://coronavirus-19-api.herokuapp.com/countries';
  static Future<List<CountryModel>> getData() async{
    try{
      final response= await http.get(url);
      if(200==response.statusCode){
        final List<CountryModel> countryModel= countryModelFromJson(response.body);
        return countryModel;
      }
      else{
        return List<CountryModel>();
      }
    }catch(e){
      return List<CountryModel>();
    }
  }

}