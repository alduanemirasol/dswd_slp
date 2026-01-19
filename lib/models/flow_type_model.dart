class FlowType {
  final int id;
  final String name;

  const FlowType({required this.id, required this.name});
  Map<String, dynamic> toMap() => {'id': id, 'name': name};
}
