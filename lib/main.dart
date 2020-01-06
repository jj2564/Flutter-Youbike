
import 'package:flutter_youbike/home/baseview.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api.dart';


void main() => runApp(BaseView());






class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouBike',
      home: MainPage(),
//      home: StationList(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Youbike'),
      ),
//      body:
    );
  }
}


class StationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Hi'),
        ),
        backgroundColor: Colors.black12,
        body: FutureBuilder<List<Station>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) => card(data[index]),
                itemCount: data.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
          future: ApiConnection().fetchData(10),
        ));
  }

  Widget card(Station item) {
    return Card(

      elevation: 0,
      color: Color.fromARGB(100, 255, 255, 255),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[Text("正常")],
                ),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(item.sna),
                      SizedBox(height: 5),
                      Text("${item.sbi}  ${item.bemp}"),
                      SizedBox(height: 10),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[Text("600m")],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}