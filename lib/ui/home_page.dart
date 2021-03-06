import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
        "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=^BVSP&apikey=7DXJR4YUPF8SQWB1"
        
        );
        response = await http.get(
          "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$_search.SAO&apikey=7DXJR4YUPF8SQWB1"
        );
        
        return json.decode(response.body); 
  }
  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"
        ),
        centerTitle: true,
        
      ),
      
    );
  }
}