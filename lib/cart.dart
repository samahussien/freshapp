import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final int result;
  bool state;
  CartPage({
    @required this.result,
    @required this.state,

  });
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var arr=['Apple','Banana','Broccoli','Carrot','corn','Potatos','Pepper'];
  var img=['assets/pics/apples.jpg','assets/pics/bananas.jpg','assets/pics/broccoli.jpg','assets/pics/carrots.jpg','assets/pics/corn.jpg','assets/pics/potato.jpg','assets/pics/pepper.jpg'];
  int numberOfItems=1;
  bool x=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: _BuildContent(),
    );
  }
  /* child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index)=>buildVegItems(index),
                    separatorBuilder: (context,index)=>SizedBox(width: 10.0),
                    itemCount:7 ,
                  ),*/
  Widget _BuildContent(){
    return widget.state?Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top:20.0,
              left: 30, right: 30),
          child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2,2), //(x,y)
                    blurRadius:5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('${img[widget.result]}'),
                      height: 100,
                      width: 100,

                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Text("${arr[widget.result]}",
                            style: TextStyle( fontSize: 18,),
                          ),
                          SizedBox(height: 5,),
                          Text('\$${4.5+widget.result*5}'),

                        ],)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom:10.0,right: 15),
                    child: Column(
                      children: [
                        CupertinoButton(
                          minSize: double.minPositive,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(
                              Icons.add_circle,
                              color: Colors.lightGreen,
                              size: 20

                          ),
                          onPressed: () {
                            setState(() {
                              numberOfItems++;
                              //  price*=numberOfItems;
                            });
                          },
                        ),
                        Text("$numberOfItems"),
                        CupertinoButton(
                            minSize: double.minPositive,
                            padding: EdgeInsets.only(top: 10,),
                            child: Icon(
                                Icons.remove_circle,
                                color: Colors.lightGreen,
                                size: 20
                            ),
                            onPressed: () {
                              setState(() {
                                if (numberOfItems>1)
                                  numberOfItems--;
                                // price=price/numberOfItems;

                              });
                            }                        ),
                      ],
                    ),
                  )
                ],

              )),
        ),

      ],
    ):Column();
  }

}
