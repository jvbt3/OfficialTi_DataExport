import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Whatsapp whatsapp = Whatsapp();

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Send Message'),
              onPressed: () async {
                final reuturn = await whatsapp.messagesTemplate(
                    to: 5544988683003, templateName: "hello_world");
                print(reuturn);
              },
            ),
          ],
        ),
      ),
    );
  }
}
