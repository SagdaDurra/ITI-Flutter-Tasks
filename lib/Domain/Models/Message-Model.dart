class MessageModel {
  // is this message ours or from the model
  final bool isUser ;
  // the content of the message
  final String message ;
  // the date of the message
  final DateTime date ;

  MessageModel({required this.isUser , required this.message , required this.date});

}