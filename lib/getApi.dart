import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetApiWithListview extends StatefulWidget {
  const GetApiWithListview({super.key});

  @override
  State<GetApiWithListview> createState() => _GetApiWithListviewState();
}

class _GetApiWithListviewState extends State<GetApiWithListview> {
  List<dynamic> jsonList = [];
  final CarouselController _carouselController = CarouselController();  // Carousel controller

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data as List<dynamic>;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Shopping',style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Text('Search any product or url'),
                      Icon(Icons.camera_alt)
                    ],
                  ),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("We thik you will love these",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: (){},

                  )
                ],
              ),
            ),



            Expanded(
              child: CarouselSlider.builder(
                itemCount: jsonList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  var item = jsonList[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 300, // Set the height of the card
                      width: 300, // Set the width of the card
                      child: IntrinsicHeight(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 0.0),
                                 child: Container(
                                   height: 40,
                                   width: 40,
                                   decoration: BoxDecoration(
                                     color: Colors.pink,
                                     shape: BoxShape.circle
                                   ),
                                   child: IconButton(
                                     color: Colors.white,
                                     icon: Icon(Icons.heart_broken_rounded),
                                     onPressed: (){},
                                   ),
                                 ),
                               ),
                                Center(
                                  child: Image.network(
                                    item['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Center(
                                  child: Text(
                                    item['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Text(
                                      '${item['rating']['rate']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                        '₹${item['price']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.green),
                                      ),
                                     IconButton(
                                         icon:Icon(Icons.shopping_cart),
                                     onPressed: (){},)
                                   ],
                                 ),
                                      ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
              ),
            )

          ],
        ),
      )

    );
  }
}
