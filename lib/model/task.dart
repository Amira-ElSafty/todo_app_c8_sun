
class Task{
  String id ;
  String title ;
  String description ;
  int date ;
  bool isChecked ;

  Task({this.id = '',required this.title,required this.description,required this.date,
    this.isChecked = false
  });

  Task.fromJson(Map<String,dynamic> json):this(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    date: json['dateTime'] as int,
    isChecked: json['isChecked'] as bool
  );

  Map<String,dynamic> toJson(){
    return {
      "id" : id ,
      "title" : title ,
      "description" : description ,
      "dateTime" : date ,
      "isChecked" : isChecked
    };
  }
}