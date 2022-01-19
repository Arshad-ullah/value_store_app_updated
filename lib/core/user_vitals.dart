class UserVitals {
  String? id;
  String? userId;
  double? weight;
  double? height;
  String? bloodType;
  bool? terminalIllness;
  List<String>? terminalIllnessList;
  String? terminalIllnessListString;
  String? createdAt;
  String? updatedAt;

  UserVitals(
      {this.id,
      this.userId,
      this.weight,
      this.height,
      this.bloodType,
      this.terminalIllness,
      this.terminalIllnessList,
      this.terminalIllnessListString,
      this.createdAt,
      this.updatedAt});

  UserVitals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    weight = json['weight'];
    height = json['height'];
    bloodType = json['blood_type'];
    terminalIllness = json['terminal_illness'];
    final String illnessListString = json['terminal_illness_list'];
    terminalIllnessList = illnessListString.split(',').toList() ?? [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print('User Vitals: ${this.toJson()}');
  }

  UserVitals.fromJson2(Map<String, dynamic> json) {
    weight = json['weight'];
    height = json['height'];
    bloodType = json['blood_type'];
    terminalIllness = json['terminal_illness'];
    final String illnessListString = json['terminal_illness_list'];
    terminalIllnessList = illnessListString.split(',').toList() ?? [];
  }

  UserVitals.fromJson3(Map<String, dynamic> json) {
    weight = double.parse(json['weight']);
    height = double.parse(json['height']);
    bloodType = json['blood_type'];
    terminalIllness = json['terminal_illness'];
    final String illnessListString = json['terminal_illness_list'];
    terminalIllnessList = illnessListString.split(',').toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['blood_type'] = this.bloodType;
    data['terminal_illness'] = this.terminalIllness;
    data['terminal_illness_list'] = this.terminalIllnessList;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['height'] = this.height.toString();
    data['blood_type'] = this.bloodType;
    data['terminal_illness'] = this.terminalIllness;
    if (this.terminalIllness?? false) {
      data['terminal_illness_list'] = this.terminalIllnessListString;
    }
    return data;
  }
}
