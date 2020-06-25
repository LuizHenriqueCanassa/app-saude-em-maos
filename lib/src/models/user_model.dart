class UserValidate{
  String userTypeEnum;
  int userId;

  UserValidate({this.userTypeEnum, this.userId});

  factory UserValidate.fromJson(Map<String, dynamic> json){
    return UserValidate(
      userTypeEnum: json['userTypeEnum'],
      userId: json['userId']
    );
  }
}

class User{

}