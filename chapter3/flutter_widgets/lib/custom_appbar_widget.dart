import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(null, 150),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: Container(
              color: Colors.blue,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.navigate_before,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      "自定义appBar",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.cloud_queue,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(),
    );
  }
}
