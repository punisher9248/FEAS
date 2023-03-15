
import 'package:flutter/material.dart';

import '../../All_Widgets/widgets.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.pop(context);},
                    child:  Image.asset("assets/icons/back.png"),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),

                  Text("Chat", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                  ),),





                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.05,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg2.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg3.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg4.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg5.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            ChatWidget(
                eventname: "Music Event",
                img: "assets/images/chatimg6.png",
                msg: "Listen David, I have problem .....",
                date: "18 Jan"
            ),


          ],
        ),
      ),


    );
  }
}
