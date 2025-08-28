import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qty = 0;
  int currentIndex = 0;

  
  @override
  void initState() {
    super.initState();
    qty = 1;
  }

  void increase() {
    setState(() {
      qty++;
    });
  }

  void decrease() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 8,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.add_circled)),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text(qty.toString(), style: TextStyle(fontSize: 24)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: decrease, icon: Icon(Icons.remove)),
              SizedBox(width: 20),
              IconButton(onPressed: increase, icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}