import 'dart:async';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Messages> _messages = [];
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _getCurrentUserId();
    _timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => _fetchMessages());
  }

  Future<void> _getCurrentUserId() async {
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    setState(() {
      currentUserId = userData['uid'] ?? '';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _postMessage(String content) async {
    final url = Uri.parse(BASE_URL + CHATBOT);
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    String jwtToken = userData['jwtToken'] ?? '';
    String uid = userData['uid'] ?? '';
    final headers = <String, String>{
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };
    final body =
        jsonEncode({"sender": uid, "content": content, "contentType": "text"});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        log('Message sent successfully: ${response.body}');
        _controller.clear();
        _fetchMessages();
      } else {
        log('Failed to send message: ${response.statusCode}');
      }
    } catch (error) {
      log('Error sending message: $error');
    }
  }

  Future<void> _fetchMessages() async {
    final url = Uri.parse(BASE_URL + CHATBOT);
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    String jwtToken = userData['jwtToken'] ?? '';
    final headers = <String, String>{
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        if (body['messages'] != null) {
          final List<dynamic> messagesJson = body['messages'];
          final List<Messages> messages = messagesJson
              .map((dynamic item) => Messages.fromJson(item))
              .toList();
          setState(() {
            _messages.clear();
            _messages.addAll(messages);
          });
          _scrollToBottom();
        } else {
          log('No messages found in the response.');
        }
      } else {
        log('Failed to fetch messages: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _messages.isEmpty
                ? const Center(child: Text('No messages available.'))
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isUserMessage = message.sender.id == currentUserId;
                      return Align(
                        alignment: isUserMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: isUserMessage ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            message.content,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _postMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Messages {
  Messages({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.content,
    required this.contentType,
    required this.isRead,
    required this.companyId,
    required this.createdAt,
    required this.V,
  });

  late final String id;
  late final Sender sender;
  late final String receiver;
  late final String content;
  late final String contentType;
  late final bool isRead;
  late final String companyId;
  late final String createdAt;
  late final int V;

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    sender = Sender.fromJson(json['sender']);
    receiver = json['receiver'];
    content = json['content'];
    contentType = json['contentType'];
    isRead = json['isRead'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['sender'] = sender.toJson();
    data['receiver'] = receiver;
    data['content'] = content;
    data['contentType'] = contentType;
    data['isRead'] = isRead;
    data['companyId'] = companyId;
    data['createdAt'] = createdAt;
    data['__v'] = V;
    return data;
  }
}

class Sender {
  Sender({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImage,
  });

  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String profileImage;

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profileImage'] = profileImage;
    return data;
  }
}
