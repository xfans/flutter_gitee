import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'login')
  String login;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'followers_url')
  String followersUrl;

  @JsonKey(name: 'following_url')
  String followingUrl;

  @JsonKey(name: 'gists_url')
  String gistsUrl;

  @JsonKey(name: 'starred_url')
  String starredUrl;

  @JsonKey(name: 'subscriptions_url')
  String subscriptionsUrl;

  @JsonKey(name: 'organizations_url')
  String organizationsUrl;

  @JsonKey(name: 'repos_url')
  String reposUrl;

  @JsonKey(name: 'events_url')
  String eventsUrl;

  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'site_admin')
  bool siteAdmin;

  @JsonKey(name: 'blog')
  String blog;

  @JsonKey(name: 'bio')
  String bio;

  @JsonKey(name: 'public_repos')
  int publicRepos;

  @JsonKey(name: 'public_gists')
  int publicGists;

  @JsonKey(name: 'followers')
  int followers;

  @JsonKey(name: 'following')
  int following;

  @JsonKey(name: 'stared')
  int stared;

  @JsonKey(name: 'watched')
  int watched;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  User(
    this.id,
    this.login,
    this.name,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.blog,
    this.bio,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.stared,
    this.watched,
    this.createdAt,
    this.updatedAt,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
