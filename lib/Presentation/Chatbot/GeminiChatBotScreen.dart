import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iti_flutter/Domain/Models/Message-Model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Geminichatbotscreen extends StatefulWidget {
  @override
  State<Geminichatbotscreen> createState() => _GeminichatbotscreenState();
}

class _GeminichatbotscreenState extends State<Geminichatbotscreen> {

  final ApiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
  late final model = GenerativeModel(model: "gemini-2.5-flash", apiKey: ApiKey );
  final List<MessageModel> messages = [];
  final TextEditingController Textcontroller = TextEditingController();
  Future<void> sendMessage(String message) async {
    final message = Textcontroller.text;

    setState(() {
      messages.add(MessageModel(isUser: true, message: message, date: DateTime.now()));
    });
    final content =[Content.text(message)];
    final request = await model.generateContent(content);
    setState(() {
      messages.add(MessageModel(isUser: false, message: request.text ?? "", date: DateTime.now()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context , index){
            final message = messages[index];
            return userPrompt(isUser: message.isUser , message: message.message , date: message.date);
          },
          itemCount: messages.length,
          ),
          ),
          Padding(padding: EdgeInsets.all(25) ,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: Textcontroller,
                      style: TextStyle(color: Colors.black , fontSize: 17),
                      decoration: InputDecoration(
                        hintText: "Message Gemini " ,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                      ),
                      ),

                    ),
                  ),
                ),
                SizedBox(),
                GestureDetector(
                  onTap: (){
                    sendMessage(Textcontroller.text);
                    Textcontroller.clear();
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.send , color: Colors.white , size: 30,  ),
                  ),
                ),

              ],
            ) ,

          )

        ],
      ),

      
    );
  }
}
Container userPrompt ({required final bool isUser , required final String message , required final DateTime date }){
  return Container (
    width: double.infinity,
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.symmetric(vertical: 15).copyWith(right: isUser ? 80 : 15 , left: isUser ? 15 : 80),
    decoration: BoxDecoration(
      color: isUser ? Colors.deepPurple : Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isUser ? FontWeight.bold : FontWeight.normal,
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${date.hour}:${date.minute}",
              style: TextStyle(
                fontSize: 13,
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ],
    ) ,
  );
}