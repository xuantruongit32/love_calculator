class Love {
  String? fname;
  String? sname;
  String? percentage;
  String? result;

  Love({this.fname, this.sname, this.percentage, this.result});
  Love.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    sname = json['sname'];
    percentage = json['percentage'];
    result = json['result'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fname'] = this.fname;
    data['sname'] = this.sname;
    data['percentage'] = this.percentage;
    data['result'] = this.result;
    return data;
  }
}
