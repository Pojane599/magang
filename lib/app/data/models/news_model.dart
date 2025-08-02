class NewsModel {
  final int id;
  final String title;
  final String content;
  final String? image;
  final int? createdByCompanyId;
  final int? createdByTenantId;
  final String? companyName;  // baru
  final String? tenantName;   // baru
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    this.createdByCompanyId,
    this.createdByTenantId,
    this.companyName,
    this.tenantName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      createdByCompanyId: json['created_by_company_id'],
      createdByTenantId: json['created_by_tenant_id'],
      companyName: json['company_name'],  // pastikan backend mengirim
      tenantName: json['tenant_name'],    // pastikan backend mengirim
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
