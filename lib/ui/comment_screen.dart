import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();

}

class _CommentScreenState extends State<CommentScreen> {

  List<String> commentList = [];
  TextEditingController _controller = TextEditingController();

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Comments"),
      ),
      body: Column(
      children: <Widget>[ _getTextField(), _getComment(), ],
    ),
      );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        onSubmitted: (text) {
          commentList.add(text);
          _controller.clear();
          setState(() {});
        },
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: 'Write your comment here',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _getComment() {
    return Expanded(
        child: ListView.builder
          (
            itemCount: commentList.length,
            itemBuilder: (BuildContext ctxt, int Index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text('${Index+1}. ${commentList[Index]}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                  ),
                ),
              );
            }
        )
    );
  }
}