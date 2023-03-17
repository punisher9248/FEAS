import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/colors.dart';
import 'package:fyp_feas/All_Screens/Dashboard/redeem_screen.dart';
import 'package:fyp_feas/All_Widgets/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'chat_screen.dart';
import 'details_screen.dart';
import 'notification_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  var geoLocator= Geolocator();

  Future<Position> getUserLocation() async{await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) {print("error"+error.toString());});

  return await Geolocator.getCurrentPosition();


  }


  var currentAdd;
  dynamic latCurrent;
  dynamic longCurrent;

  String Address = 'search';

  CameraPosition  _kGooglePlex = CameraPosition(target: LatLng(24.8667, 67.0831), zoom: 14.4);

  final List<Marker>_markers= <Marker>[Marker(markerId: MarkerId('1'), position: LatLng(24.8667, 67.0831), infoWindow: InfoWindow(title: 'Your Current Position'))];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/feaslogo.png", height: 80,),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                  Spacer(),

                  InkWell(
                      onTap: (){Get.to(()=>RedeemScreen());},
                      child: Image.asset("assets/icons/redeem.png", height: 26,)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                  InkWell(
                      onTap: (){Get.to(()=>NotificationScreen());},
                      child: Image.asset("assets/icons/notification.png")),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                  InkWell(
                      onTap: (){Get.to(()=>ChatScreen());},
                      child: Image.asset("assets/icons/chat.png")),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),



                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(10)
                    ),

                    child:  Text(" Welcome To FEAS!", style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Raleway')),
                  ),

                  InkWell(
                    onTap: (){ getUserLocation().then((value) async {

                      latCurrent=value.latitude;
                      longCurrent=value.longitude;
                      List<Placemark> placemarks = await placemarkFromCoordinates(latCurrent,longCurrent);

                      Placemark place = placemarks[0];
                      Address = '${place.name} ${place.street},${place.locality}, ${place.subLocality}, ${place.postalCode}, ${place.country}';

                      currentAdd=Address;
                      print(currentAdd);

                      CameraPosition cameraPosition=CameraPosition(target: LatLng(latCurrent,longCurrent),zoom: 14);

                      final GoogleMapController controller= await _controller.future;

                      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

                      setState(() {});

                    });
                    },
                    child: Icon(Icons.my_location,size: 30, color: secondarycolor,),
                  )
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 520,
               decoration: BoxDecoration(
                 color: Colors.transparent,
               ),
                child: GoogleMap(
                  padding: EdgeInsets.only(bottom: 0),
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: _kGooglePlex,
                  markers: Set<Marker>.of(_markers),
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (GoogleMapController controller) {_controller.complete(controller);},
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              currentAdd==null? Container(
                width: 350,
                height: 60,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.add_location_sharp, color: secondarycolor,),
                          SizedBox(width: 10,),
                          Flexible(child:Text("select address", overflow: TextOverflow.ellipsis, maxLines: 2, softWrap: true)),
                        ],
                      ),
                  ),
                ),
              ):


             Container(
               width: 350,
               height: 60,
               child: Card(
                 color: Colors.white,
                 elevation: 2,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 child: Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Row(
                     children: [
                       Icon(Icons.add_location_sharp, color: secondarycolor,),
                       SizedBox(width: 10,),
                       Flexible(child: Text("${currentAdd}", overflow: TextOverflow.ellipsis, maxLines: 2, softWrap: true)),
                     ],
                   )

                 ),
               ),
             ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              
              Text("Items to Rent", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),



              Container(height: Get.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('UserDataInfo').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot user = snapshot.data!.docs[index];
                          String userId = user.id;

                          return StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('UserDataInfo')
                                .doc(userId)
                                .collection('MyProduct')
                                .snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> subSnapshot) {
                              if (!subSnapshot.hasData) {
                                return CircularProgressIndicator();
                              }

                              List<DocumentSnapshot> subDocs = subSnapshot.data!.docs;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: subDocs.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      DocumentSnapshot subDoc = subDocs[index];

                                      return Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                        child: Container(
                                          height: 140,
                                          width: 380,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,

                                              boxShadow: [
                                                BoxShadow(
                                                  //blurRadius: 0.5,
                                                )
                                              ]
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 15,),
                                                Image.network("${subDoc['ProductImage']}"),

                                                SizedBox(width: 15,),

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    Text("${subDoc['ProductName']}", style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 18
                                                    ),),
                                                    SizedBox(height: 15,),

                                                    Text("${subDoc['ProductDescription']}", style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16
                                                    ),),

                                                    SizedBox(height: 30,),


                                                  ],
                                                ),
                                                Spacer(),

                                                Column(
                                                  children: [
                                                    Text("${subDoc['Location']}",style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20
                                                    ), ),
                                                    SizedBox(height: 25,),

                                                    Text("${subDoc['Price']}",style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20
                                                    ), ),
                                                  ],
                                                ),
                                                SizedBox(width: 20,)

                                              ],
                                            ),
                                          ),


                                        ),
                                      );








                                      ListTile(
                                        title: Text(subDoc['Location']),
                                        subtitle: Text(subDoc['Location']),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  )
              )









            //   InkWell(
            //     onTap: (){Get.to(()=>DetailsScreen());},
            //     child: NearbyEventsWidget(
            //       title: "Saw",
            //       rent: "Rent for 2 days",
            //       reviews: "4.8",
            //       reviews2: "(356 reviews)",
            //       price: "Rs 50",
            //       img: 'assets/images/saw.png'
            // ),
            //   ),
            //
            //   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            //
            //
            //
            //   NearbyEventsWidget(
            //       title: "Saw",
            //       rent: "Rent for 3 days",
            //       reviews: "4.8",
            //       reviews2: "(356 reviews)",
            //       price: "Rs 100",
            //       img: 'assets/images/saw.png'
            //   ),
            //
            //   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            //
            //
            //   NearbyEventsWidget(
            //       title: "Saw",
            //       rent: "Rent for 3 days",
            //       reviews: "4.8",
            //       reviews2: "(356 reviews)",
            //       price: "Rs 100",
            //       img: 'assets/images/saw.png'
            //   ),
            //
            //   SizedBox(height: MediaQuery.of(context).size.height*0.02,),









            ],
          ),
        ),
      ),


    );
  }
}
