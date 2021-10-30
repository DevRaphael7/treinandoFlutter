class Task{
  final int id;
  final int userId;
  final String name;
  final String date;
  final int realized;

  Task(this.id, this.userId, this.name, this.date, this.realized);

  Task.fromJson(Map json)
      : id = json['id'],
        userId = json['userId'],
        name = json['name'],
        date = json['date'],
        realized = json['realized'];
}