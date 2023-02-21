import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              children: [
                Image.asset("assets/icons/back.png"),
                SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                Text("Details", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),),
                
                Spacer(),
                
                Image.asset("assets/icons/shopping.png"),
                SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                Image.asset("assets/icons/favourite.png"),
                SizedBox(width: MediaQuery.of(context).size.width*0.01,),




              ],
            )

          ],
        ),
      ),

    );
  }
}
