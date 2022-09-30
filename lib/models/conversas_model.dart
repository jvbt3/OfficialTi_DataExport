// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/chat_model.dart';

class ConversasModel {
  String nome;
  String ultimaMensagem;
  String status;
  TimeOfDay hora;
  List<ChatModel>? chats;

  ConversasModel({
    required this.nome,
    required this.ultimaMensagem,
    required this.status,
    required this.hora,
    this.chats,
  });
}
