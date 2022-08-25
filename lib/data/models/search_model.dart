class SearchModel {
  String? type;
  String? message;
  Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Plants>? plants;
  List<Seeds>? seeds;
  List<Tools>? tools;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plants>[];
      json['plants'].forEach((v) {
        plants!.add(Plants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <Seeds>[];
      json['seeds'].forEach((v) {
        seeds!.add(Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <Tools>[];
      json['tools'].forEach((v) {
        tools!.add(Tools.fromJson(v));
      });
    }
  }
}

class Plants {
  String? name;

  Plants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Seeds {
  String? name;

  Seeds.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Tools {
  String? name;

  Tools.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
