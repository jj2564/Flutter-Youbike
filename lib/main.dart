import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'api.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouBike',
      home: StationList(),
    );
  }
}

class StationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder<List<Station>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final Station item = data[index];
              return card(item); //Text(item.sna);
            },
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
    );
  }
}
