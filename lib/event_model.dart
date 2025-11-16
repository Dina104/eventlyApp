import 'package:flutter/material.dart';

@immutable
class Event {
  final String id;
  final String title;
  final String description;
  final String city;
  final double latitude;
  final double longitude;
  final String? imageUrl;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.latitude,
    required this.longitude,
    this.imageUrl,
  });

  static final List<Event> egyptEvents = [
    Event(
      id: '1',
      title: 'مهرجان الموسيقى الدولي',
      description: 'أكبر مهرجان موسيقي في القاهرة يجمع فنانين من جميع أنحاء العالم.',
      city: 'القاهرة',
      latitude: 30.0444,
      longitude: 31.2357,
      imageUrl: 'https://example.com/music_festival.jpg',
    ),
    Event(
      id: '2',
      title: 'معرض القاهرة الدولي للكتاب',
      description: 'أحدث الكتب والفعاليات الثقافية في معرض القاهرة الدولي للكتاب.',
      city: 'القاهرة',
      latitude: 30.0500,
      longitude: 31.2336,
      imageUrl: 'https://example.com/book_fair.jpg',
    ),
    Event(
      id: '3',
      title: 'ماراثون الإسكندرية',
      description: 'ماراثون رياضي سنوي في شوارع الإسكندرية.',
      city: 'الإسكندرية',
      latitude: 31.2001,
      longitude: 29.9187,
      imageUrl: 'https://example.com/alex_marathon.jpg',
    ),
    Event(
      id: '4',
      title: 'مهرجان السينما المصرية',
      description: 'عرض لأحدث الأفلام المصرية والورش السينمائية في الجيزة.',
      city: 'الجيزة',
      latitude: 30.0131,
      longitude: 31.2089,
      imageUrl: 'https://example.com/film_festival.jpg',
    ),
  ];
}
