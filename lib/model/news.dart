import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/model/user.dart';

class News {
  int id;
  String type;
  Actor actor;
  Repo repo;
  Org org;
  bool public;
  String createdAt;
  Payload payload;

  News(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.org,
      this.public,
      this.createdAt,
      this.payload});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
    org = json['org'] != null ? new Org.fromJson(json['org']) : null;
    public = json['public'];
    createdAt = json['created_at'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo.toJson();
    }
    if (this.org != null) {
      data['org'] = this.org.toJson();
    }
    data['public'] = this.public;
    data['created_at'] = this.createdAt;
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    return data;
  }
}

class Actor {
  int id;
  String login;
  String name;
  String avatarUrl;
  String url;
  String htmlUrl;

  Actor(
      {this.id, this.login, this.name, this.avatarUrl, this.url, this.htmlUrl});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['name'] = this.name;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}


class Org {
  int id;
  String login;
  String url;
  String avatarUrl;

  Org({this.id, this.login, this.url, this.avatarUrl});

  Org.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['url'] = this.url;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Payload {
  Comment comment;
  Repo repository;

  Payload({this.comment, this.repository});

  Payload.fromJson(Map<String, dynamic> json) {
    comment =
        json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
    repository = json['repository'] != null
        ? new Repo.fromJson(json['repository'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comment != null) {
      data['comment'] = this.comment.toJson();
    }
    if (this.repository != null) {
      data['repository'] = this.repository.toJson();
    }
    return data;
  }
}

class Comment {
  String url;
  String htmlUrl;
  int id;
  User user;
  String createdAt;
  String updatedAt;
  String body;

  Comment(
      {this.url,
      this.htmlUrl,
      this.id,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['body'] = this.body;
    return data;
  }
}