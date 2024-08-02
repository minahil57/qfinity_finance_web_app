class LoginModel {
  int? id;
  String? userNo;
  String? userName;
  String? fullName;
  String? email;
  String? contactNo;
  String? userType;
  String? role;
  String? profileImage;
  String? branch;
  String? department;
  String? culture;
  String? status;
  String? accessToken;
  String? refreshToken;
  List<UserCompany>? userCompanies;

  LoginModel({
    this.id,
    this.userNo,
    this.userName,
    this.fullName,
    this.email,
    this.contactNo,
    this.userType,
    this.role,
    this.profileImage,
    this.branch,
    this.department,
    this.culture,
    this.status,
    this.accessToken,
    this.refreshToken,
    this.userCompanies,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['id'],
        userNo: json['userNo'],
        userName: json['userName'],
        fullName: json['fullName'],
        email: json['email'],
        contactNo: json['contactNo'],
        userType: json['userType'],
        role: json['role'],
        profileImage: json['profileImage'],
        branch: json['branch'],
        department: json['department'],
        culture: json['culture'],
        status: json['status'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        userCompanies: json['userCompanies'] == null
            ? []
            : List<UserCompany>.from(
                json['userCompanies']!.map((x) => UserCompany.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userNo': userNo,
        'userName': userName,
        'fullName': fullName,
        'email': email,
        'contactNo': contactNo,
        'userType': userType,
        'role': role,
        'profileImage': profileImage,
        'branch': branch,
        'department': department,
        'culture': culture,
        'status': status,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'userCompanies': userCompanies == null ? [] : List<dynamic>.from(userCompanies!.map((x) => x.toJson())),
      };

  String? get firstName => fullName?.split(' ')[0];
}

class UserCompany {
  int? id;
  String? companyNo;
  String? companyName;
  String? logo;
  String? baseDb;
  String? dataDb;
  String? webUrl;
  String? apiurl;

  UserCompany({
    this.id,
    this.companyNo,
    this.companyName,
    this.logo,
    this.baseDb,
    this.dataDb,
    this.webUrl,
    this.apiurl,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) => UserCompany(
        id: json['id'],
        companyNo: json['companyNo'],
        companyName: json['companyName'],
        logo: json['logo'],
        baseDb: json['baseDB'],
        dataDb: json['dataDB'],
        webUrl: json['webURL'],
        apiurl: json['apiurl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyNo': companyNo,
        'companyName': companyName,
        'logo': logo,
        'baseDB': baseDb,
        'dataDB': dataDb,
        'webURL': webUrl,
        'apiurl': apiurl,
      };
}
