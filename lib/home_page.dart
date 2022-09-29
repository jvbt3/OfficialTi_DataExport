import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Whatsapp whatsapp = Whatsapp();

  List conversa = ["teste", "teste2"];

  final mensagemController = TextEditingController();

  @override
  void initState() {
    whatsapp.setup(
        accessToken:
            "EAAI3ZCh6uivIBACCUjirHqjOJgRFkfZA1suqXzbpTI23JpujUCRBtWN1i5Y3YNXkCT7B2VNdnTFylqXDuyxiKwyofTXjxlRFumzH6XQWAKMgwWZA6BSzQ51euf0iXgmeBRCne5EGipwZCVMZCugzdurTtsEHZAERwnj4ZBGcDiDM6bUFkZCSUgcDW5e5kBGCldMi833UCgWM6gZDZD",
        fromNumberId: 107930172086305 //integer
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const title = "Mensagens";
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 350,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("$index"),
                            Text("$index"),
                            Text("$index"),
                          ],
                        ),
                        Text("$index"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: conversa.length,
                  itemBuilder: (context, index) {
                    return Align(
                        alignment: index.isEven
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(conversa[index]),
                              )),
                        ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: mensagemController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        hintText: 'Mensagem',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                conversa.add(mensagemController.text);
                              });
                            },
                            icon: const Icon(Icons.send))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
          //       final reuturn = await whatsapp.messagesTemplate(
          //           to: 5544988683003, templateName: "hello_world");
          //       print(reuturn);