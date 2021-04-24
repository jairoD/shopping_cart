import 'dart:convert';

class CartsModel {
  String id;
  String status;
  CartsModel({
    this.id,
    this.status,
  });

  CartsModel copyWith({
    String id,
    String status,
  }) {
    return CartsModel(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
    };
  }

  factory CartsModel.fromMap(Map<String, dynamic> map) {
    return CartsModel(
      id: map['id'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartsModel.fromJson(String source) =>
      CartsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartsModel(id: $id, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartsModel && other.id == id && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode;
}
