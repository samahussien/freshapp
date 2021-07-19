import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh/cart.dart';

class ApplePage extends StatefulWidget {
  final int result;
  ApplePage({
    @required this.result,
  });

  @override
  _ApplePageState createState() => _ApplePageState();
}

class _ApplePageState extends State<ApplePage> {
  int counter=0;
  var arr=['Apple','Banana','Broccoli','Carrot','corn','Potatos','Pepper'];
  var img=['assets/pics/apples.jpg','assets/pics/bananas.jpg','assets/pics/broccoli.jpg','assets/pics/carrots.jpg','assets/pics/corn.jpg','assets/pics/potato.jpg','assets/pics/pepper.jpg'];
  bool state=false,favorite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title:Row(
          children:[
            Expanded(
              child: Text(
              'eFresh',
              style: TextStyle(
                  color: Colors.lightGreen
              ),



          ),
            ),
            IconButton(
                icon: Icon(
                  Icons.shopping_cart
                ), onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> CartPage(result:widget.result,state:state),
                  ));
            },
              color: Colors.lightGreen,
            )
          ]
        ),

      ),
      body:_buildContent(),
    );
  }

  Widget _buildContent(){
    return Column(
      children: [
        Padding(
        padding: const EdgeInsets.only(left:40.0,right: 40.0,top: 25.0),
        child: Container(

       height: 250,
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
        child: Column(

          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage('${img[widget.result]}'),
                width: 250,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${arr[widget.result]}",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  SizedBox(height: 5),
                  Text("1 KG",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 5),
                  Text("\$${4.5+widget.result*5}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            )

          ],
        ),

    ),
      ),
        Padding(
          padding: const EdgeInsets.only(left:20,right:20,top:40.0,bottom: 40.0),
          child: Text('jdkd kdjdcm dskcdscdsjdkd kdjdcm dskcdscdsjdkd kdjdcm'
              ' dskcdscdsjdkd kdjdcm dskcdscdsjdkd kdjdcm dskcdscdsjdkd kdjd'
              'cm dskcdscdsjdkd kdjdcm dskcdscds',
            style: TextStyle(
              fontSize: 12.0
            ),
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Related Items",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 70,
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
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('${img[widget.result]}'),
                          height: 50,
                          width: 50,

                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(children: [
                              Text("${arr[widget.result]}"),
                              Text('\$${4.5+widget.result*5}'),

                            ],)
                          ],
                        ),
                      ),
                      favorite? IconButton(
                        icon:Icon(Icons.favorite),
                        color: Colors.red,
                        onPressed: (){
                          setState(() {
                            favorite=false;

                          });
                        },
                      ):IconButton(
                        icon:Icon(Icons.favorite_border),
                        onPressed: (){
                          setState(() {
                            favorite=true;
                          });
                        },
                      )
                    ],

              ),
                )),
            ],
          ),
        ),
        SizedBox(height:40 ,),
        state?Expanded(
          child:   Container(
            width:double.infinity ,
            color:Colors.grey,
            child: MaterialButton(
              onPressed: (){
                setState(() {
                  state=false;
                });
              },
              height:50.0,
              child:Text(
                'Added',
                style: TextStyle(
                  color: Colors.white,
                ),
              ) ,
            ),
          )
        ):Expanded(
            child:   Container(
              width:double.infinity ,
              color:Colors.lightGreen,
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    state=true;
                  });
                },
                height:50.0,
                child:Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            )
        )


        //Column(),
     //   Column(),
     //   Container(),
      ],
    );
  }
}
