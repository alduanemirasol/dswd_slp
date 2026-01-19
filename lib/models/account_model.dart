class AccountModel {
  final int id;
  final String associationName;
  final String mobileNumber;
  final String pinHash;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AccountModel({
    required this.id,
    required this.associationName,
    required this.mobileNumber,
    required this.pinHash,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert DB row to model
  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      associationName: map['association_name'],
      mobileNumber: map['mobile_number'],
      pinHash: map['pin'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  // Convert model to DB row
  Map<String, dynamic> toMap() {
    return {
      'association_name': associationName,
      'mobile_number': mobileNumber,
      'pin': pinHash,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
