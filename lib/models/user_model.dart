class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> favouriteEventsIds;

  UserModel({
    required this.email,
    required this.name,
    required this.id,
    required this.favouriteEventsIds,
  });
  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        favouriteEventsIds:
            (json["favouriteEventsIds"] as List<dynamic>)
                .map((favEventId) => favEventId.toString())
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "favouriteEventsIds": favouriteEventsIds,
  };
}
