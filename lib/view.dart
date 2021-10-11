import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_example/controller.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final _controller = Controller();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await _controller.getData();
    setState(() => _controller.isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _controller.isLoading
          ? Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: _controller.model!.countries!.length,
              itemBuilder: (context, index) {
                final country = _controller.model!.countries![index];
                return ListTile(
                  title: Text(country.name ?? ''),
                );
              },
            ),
    );
  }
}
