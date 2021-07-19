import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh/apple.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var arr=['Apple','Banana','Broccoli','Carrot','corn','Potatos','Pepper'];
  var img=['assets/pics/apples.jpg','assets/pics/bananas.jpg','assets/pics/broccoli.jpg','assets/pics/carrots.jpg','assets/pics/corn.jpg','assets/pics/potato.jpg','assets/pics/pepper.jpg'];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Expanded(
              child:
              Text(
                'eFresh',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 25.0,
                ),
              ),
            ),
            Icon(Icons.search,color: Colors.grey,size: 30.0,),
          ],
        ),

      ),
      body:_buildContent(),
    );
  }
  Widget _buildContent(){
    return Column(
      children: [

        Container(
              child: Column(
                children:[
                  Image(
                    image: AssetImage('assets/pics/veg.jpg'),
                  ),
                ]
              ),
            ),
        Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    decoration: BoxDecoration(
                        color:Colors.lightGreen.withOpacity(0.3),
                      border: Border.all(width:2,color: Colors.lightGreen.withOpacity(0.8))
                    ),
                    child: MaterialButton(
                      height: 50.0,

                      child: Text(
                          'Free Delivery',
                        style: TextStyle(color: Colors.lightGreen),
                      ),

                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.yellow.withOpacity(0.3),
                        border: Border.all(width:2,color: Colors.yellow.withOpacity(0.8),
                        ),
                    ),

                    child: MaterialButton(
                      height: 50.0,
                      child: Text('Near Me',
                        style: TextStyle(color: Colors.yellow[700],),),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.pink.withOpacity(0.3),
                      border: Border.all(width:2,color: Colors.pink.withOpacity(0.8),
                      ),
                    ),
                    child: MaterialButton(
                      height: 50.0,
                      child: Text('Popular',
                        style: TextStyle(
                          color: Colors.pink[700]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:18.0,bottom: 10.0),
                child: Container(
                  child: Text(
                    'Fresh sale',
                    style: TextStyle(fontSize: 25.0,color: Colors.lightGreen),
                  ),
                ),
              ),
              Padding(

                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
                ),
                child: Container(
                  height: 195.0,

                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index)=>buildVegItems(index),
                    separatorBuilder: (context,index)=>SizedBox(width: 10.0),
                    itemCount:7 ,
                  ),
                )
              )
            ],
          ),
        ),
        SizedBox(height: 40,),
        Expanded(
          child: Container(
            width:double.infinity ,
            color:Colors.lightGreen,
            child: MaterialButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> ApplePage(result:3),
                    ));
              },
              height:50.0,
              child:Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ) ,
            ),
          ),
        )

      ],
    );
  }
  buildVegItems(index)=>GestureDetector(
    onTap: (){

      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context)=> ApplePage(result:index),
      ));
    },
    child: Container(


      width: 150,
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
              image: AssetImage('${img[index]}'),
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${arr[index]}",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                ),
                SizedBox(height: 5),
                Text("1 KG",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(height: 5),
                Text("\$${4.5+index*5}",
                  style: TextStyle(
                    fontSize: 15,
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
  );

}
