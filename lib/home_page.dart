import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/chat_model.dart';
import 'package:flutter_application_1/models/conversas_model.dart';
import 'package:whatsapp/whatsapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Whatsapp whatsapp = Whatsapp();

  List<ConversasModel> conversa = [
    ConversasModel(
        nome: 'João Bosco',
        ultimaMensagem: ':)',
        status: 'Atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: ':)',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'Naiara Azevedo',
        ultimaMensagem: 'Quero Cantar!',
        status: 'Em espera!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Quero Cantar!',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'Wagner OfficialTi',
        ultimaMensagem: 'Servidor caiu aqui ó...',
        status: 'Em atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Servidor caiu aqui ó...',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'Marquin',
        ultimaMensagem: ':like:',
        status: 'Atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: ':like:',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'Suporte4',
        ultimaMensagem: ':)',
        status: 'Atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Olá, tudo bem?',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'Desenv01',
        ultimaMensagem: 'Boa Tarde! Preciso de ajuda...',
        status: 'Atribuido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Olá, tudo bem? Preciso de ajuda...',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'joao2',
        ultimaMensagem: ':)',
        status: 'Atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Olá, tudo bem?',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
    ConversasModel(
        nome: 'joao1',
        ultimaMensagem: ':)',
        status: 'Atendido!',
        hora: const TimeOfDay(hour: 15, minute: 0),
        chats: [
          ChatModel(
            mensagem: 'Olá, tudo bem?',
            hora: const TimeOfDay(hour: 15, minute: 0),
          ),
        ]),
  ];

  bool chatAberto = false;

  List chat = [];

  final mensagemController = TextEditingController();

  int? conversasSelecionadas = 0;

  @override
  void initState() {
    whatsapp.setup(
        accessToken:
            "EAAI3ZCh6uivIBANKNvd9C4fxewwNIcDVvZBqdy0NJEZBfEZCwx3EhShMEpGJuGem9ZBOVBGm7HiC6qf4smlZAjCwFFkVnnGptyhZB74IdU8uL8s4daTujEzFBd59YgT3txBmdxxoZAffBmFWzqdmshoilCHuJ2nG9ZAXx4ZCG086xSoMw5KLmHB4adKOAXHO3jfd5DfZAGvijqQXMgNIalw8IIvFEDjomVMf9sZD",
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
              itemCount: conversa.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        chatAberto = true;
                        conversasSelecionadas = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conversa[index].nome,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                conversa[index].ultimaMensagem,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(height: 8),
                              Text("status: ${conversa[index].status}"),
                            ],
                          ),
                          Text("${conversa[index].hora}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Visibility(
              visible: chatAberto,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        chatAberto = false;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            conversa[conversasSelecionadas!].chats!.length,
                        itemBuilder: (context, index) {
                          return Align(
                              alignment: index.isEven
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                          conversa[conversasSelecionadas!]
                                              .chats![index]
                                              .mensagem),
                                    )),
                              ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.newline,
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
                                      chat.add(mensagemController.text);
                                      // final reuturn =
                                      //     await whatsapp.messagesTemplate(

                                      //         to: 5544988683003,
                                      //         templateName: conversa);
                                      // print(reuturn);
                                    });
                                  },
                                  icon: const Icon(Icons.send))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
