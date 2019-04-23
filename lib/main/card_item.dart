import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;
  final Widget nextPage;

  const CardItem(this.title, this.nextPage): super();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<Route<Object>>(
                    builder: (context) => nextPage
                )
            );
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(title),
                ),
              ],
            ),
            elevation: 4.0,
          ),
        )
    );
  }
}