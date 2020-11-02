import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psv_volvere/Model/cardmodel.dart';
import 'package:psv_volvere/Screen/addDetails.dart';
import 'package:psv_volvere/utility/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primarycolor = Color.fromRGBO(0, 50, 156, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volvere'),
        backgroundColor: primarycolor,
      ),
      backgroundColor: primarycolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddDetails()));
        },
        backgroundColor: primarycolor,
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white),
        child: CardList.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/empty.json'),
                    Text(
                      'List Is Empty \nTry to Add Content By Click on "+" button',
                      style: ktext.copyWith(
                        color: kSubText,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: CardList.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: CardList[index].color,
                        child: ListTile(
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: CupertinoColors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                CardList.removeAt(index);
                              });
                            },
                          ),
                          title: Text(
                            CardList[index].name,
                            style: ktext,
                          ),
                        ),
                      ),
                    )),
      ),
    );
  }
}
