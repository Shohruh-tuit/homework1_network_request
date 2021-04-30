import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pdp_s5_homework/model/post_model.dart';
import 'package:pdp_s5_homework/services/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data;

  void _apiGetPostList() {
    Network.GET(Network.API_CREATE, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response),
        });
  }

  void _apiGetOne() {
    Network.GET(Network.API_ONE, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response),
        });
  }

  void _apiCreatePost(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiUpdatePost(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiDeletePost(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _apiGetPostList();
    // _apiGetOne();
    var post = new Post(id: 21, name: "test", salary: "123", age: "23");
    // _apiCreatePost(post);
    // _apiUpdatePost(post);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No DATA"),
      ),
    );
  }
}
