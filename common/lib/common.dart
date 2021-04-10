library common;

class SocketEvent {
  final String name;
  final String room;
  final String text;
  final SocketEventType type;

  SocketEvent({
    required this.name,
    required this.room,
    this.text = '',
    required this.type,
  });

  factory SocketEvent.fromJson(Map json) {
    return SocketEvent(
      name: json['name'],
      room: json['room'],
      text: json['text'],
      type: SocketEventType.values
          .firstWhere((element) => element.toString() == json['type']),
    );
  }

  Map toJson() {
    return {
      'name': name,
      'room': room,
      'text': text,
      'type': type.toString(),
    };
  }
}

enum SocketEventType { enter_room, leave_room, message }
