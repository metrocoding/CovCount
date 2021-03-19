import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  final Function getData;

  ConnectionError(this.getData);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_outlined, color: Colors.black, size: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Connection error",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.refresh_outlined,
                size: 40,
                color: Colors.blueAccent,
              ),
              onPressed: getData)
        ],
      ),
    );
  }
}
