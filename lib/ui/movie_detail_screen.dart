
import 'package:flutter/material.dart';
import 'package:flutter_movi_demo/data/movie.dart';
import 'package:flutter_movi_demo/ui/comment_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie _detail;

  MovieDetailScreen(this._detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_detail.title),
      ),
      body: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _getImage(),
                  _setActions(context),
                  _getText(),
                  _getNavigationBar()
                ]),
          ))
//      Center(child: Text(_detail.overview)),
    );
  }

  Widget _getImage() {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage("https://image.tmdb.org/t/p/w600_and_h900_bestv2${_detail.posterPath}")),

      ),
    );
  }

  Widget _setActions(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Stack(children: <Widget>[
        Positioned(
          left: 0,
          child: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.favorite_border),
          ),
        ),
        Positioned(
          left: 40,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommentScreen()));
            },
            color: Colors.white,
            icon: Icon(Icons.chat_bubble_outline),
          ),
        ),
        Positioned(
          left: 80,
          child: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.near_me),
          ),
        ),
        Positioned(
          right: -5,
          child: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.bookmark_border),
          ),
        ),
      ]),
    );
  }

  Widget _getText() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Нравится: 912 241',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: 'Description ',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: _detail.overview,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    // navigate to desired screen
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '#griddynamics_kharkov #workshop #flutter',
                style: TextStyle(color: Colors.blueAccent),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                    text: '30 января 2020 \u2022',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Показать перевод',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        // navigate to desired screen
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            title: Text('Home')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.search),
            title: Text('Search')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.add_circle_outline),
            title: Text('Add')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.favorite_border),
            title: Text('News')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person_outline),
            title: Text('Profile')
        ),
      ],
    );
  }

}
