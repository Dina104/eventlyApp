import 'package:evently_app_app/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  final String userId;
  final String eventId;
  final CategoryModel category;
  final String title;
  final String description;
  final DateTime dateTime;


  EventModel({
    required this.userId,
    required this.eventId,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,

  });

  EventModel.fromJson(Map<String,dynamic>json,BuildContext context) :
     this(
        eventId: json["eventId"],
        userId: json["userId"],
        category: CategoryModel.getCategories(context).firstWhere((
            category)=>category.id == json["categoryId"]) ,
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"].toDate(),
      );


  Map<String,dynamic>toJson()=>{
    "eventId" : eventId,
    "userId" : userId,
    "categoryId":category.id,
    "title" :title,
    "description" : description,
    "dateTime" : dateTime,




  };
}

