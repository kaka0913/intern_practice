import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    required String id,
    required String title,
    required String description,
    required DateTime date,
    required String location,
    required String imageUrl,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) 
    => _$EventFromJson(json);
}
