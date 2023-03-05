class UserModel{
  final String ? id;
  final String ? name;
  final String ? phone;
  final String ? email;
  final String ? image;

  UserModel({this.phone, this.name, this.email, this.id, this.image});

  toJson(){
   return{
     "name":name,
     "email":email,
     "phone":phone,
     "image":image
   };
  }
}