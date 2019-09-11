import 'dart:convert';

class Mahasiswa{
  int id;
  String nama;
  String nim;
  String email;
  String jenisKelamin;

  Mahasiswa({
    this.id = 0,
    this.nama,
    this.nim,
    this.email,
    this.jenisKelamin
  });

  factory Mahasiswa.fromJson(Map<String,dynamic>map){
    return Mahasiswa(
      id:map["id"],
      nim:map["nim"],
      nama:map["nama"],
      email:map["email"],
      jenisKelamin:map["jenis_kelamin"]
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "nama":nama,
      "nim":nim,
      "email":email,
      "jenis_kelamin":jenisKelamin,
    };
  }

  @override
  String toString(){
    return 'Mahasiswa{id:$id,nama:$nama,nim:$nim,email:$email,jenis_kelamin:$jenisKelamin';
  } 
}

List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item)=>
  Mahasiswa.fromJson(item)));
}

String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}