class Subjects {
  String? subjectId;
  String? subjectName;
  String? subjectDesc;
  String? subjectPrice;
  String? tutor_id;
  String? subject_sessions;
  String? subject_rating;


  Subjects(
      {this.subjectId,
      this.subjectName,
      this.subjectDesc,
      this.subjectPrice,
      this.tutor_id,
      this.subject_sessions,
      this.subject_rating,
   });

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    subjectDesc = json['subject_desc'];
    subjectPrice = json['subject_price'];
    tutor_id = json['tutor_id'];
    subject_sessions = json['subject_sessions'];
    subject_rating = json['subject_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_id'] = subjectId;
    data['subject_name'] = subjectName;
    data['subject_desc'] = subjectDesc;
    data['subject_type'] = subjectPrice;
    data['subject_qty'] = tutor_id;
    data['subject_price'] = subject_sessions;
    data['subject_barcode'] = subject_rating;
    
    return data;
  }
}