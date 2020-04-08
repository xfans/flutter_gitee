import 'package:flutter_gitee/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'is_fvorites')
  bool isFavorite;
  bool get isFavo {
    if (isFavorite == null) {
      return false;
    }
    return isFavorite;
  }

  set isFavo(bool flag) {
    isFavorite = flag;
  }

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'human_name')
  String humanName;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'namespace')
  Namespace namespace;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'owner')
  Owner owner;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'private')
  bool private;

  @JsonKey(name: 'public')
  bool public;

  @JsonKey(name: 'internal')
  bool internal;

  @JsonKey(name: 'fork')
  bool fork;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'ssh_url')
  String sshUrl;

  @JsonKey(name: 'forks_url')
  String forksUrl;

  @JsonKey(name: 'keys_url')
  String keysUrl;

  @JsonKey(name: 'collaborators_url')
  String collaboratorsUrl;

  @JsonKey(name: 'hooks_url')
  String hooksUrl;

  @JsonKey(name: 'branches_url')
  String branchesUrl;

  @JsonKey(name: 'tags_url')
  String tagsUrl;

  @JsonKey(name: 'blobs_url')
  String blobsUrl;

  @JsonKey(name: 'stargazers_url')
  String stargazersUrl;

  @JsonKey(name: 'contributors_url')
  String contributorsUrl;

  @JsonKey(name: 'commits_url')
  String commitsUrl;

  @JsonKey(name: 'comments_url')
  String commentsUrl;

  @JsonKey(name: 'issue_comment_url')
  String issueCommentUrl;

  @JsonKey(name: 'issues_url')
  String issuesUrl;

  @JsonKey(name: 'pulls_url')
  String pullsUrl;

  @JsonKey(name: 'milestones_url')
  String milestonesUrl;

  @JsonKey(name: 'notifications_url')
  String notificationsUrl;

  @JsonKey(name: 'labels_url')
  String labelsUrl;

  @JsonKey(name: 'releases_url')
  String releasesUrl;

  @JsonKey(name: 'recommend')
  bool recommend;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'forks_count')
  int forksCount;

  @JsonKey(name: 'stargazers_count')
  int stargazersCount;

  @JsonKey(name: 'watchers_count')
  int watchersCount;

  @JsonKey(name: 'default_branch')
  String defaultBranch;

  @JsonKey(name: 'open_issues_count')
  int openIssuesCount;

  @JsonKey(name: 'has_issues')
  bool hasIssues;

  @JsonKey(name: 'has_wiki')
  bool hasWiki;

  @JsonKey(name: 'can_comment')
  bool canComment;

  @JsonKey(name: 'pull_requests_enabled')
  bool pullRequestsEnabled;

  @JsonKey(name: 'has_page')
  bool hasPage;

  @JsonKey(name: 'license')
  String license;

  @JsonKey(name: 'outsourced')
  bool outsourced;

  @JsonKey(name: 'project_creator')
  String projectCreator;

  @JsonKey(name: 'members')
  List<String> members;

  @JsonKey(name: 'pushed_at')
  String pushedAt;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'stared')
  bool stared;

  @JsonKey(name: 'watched')
  bool watched;

  @JsonKey(name: 'permission')
  Permission permission;

  @JsonKey(name: 'relation')
  String relation;

  Repo(
    this.id,
    this.isFavorite,
    this.fullName,
    this.humanName,
    this.url,
    this.namespace,
    this.path,
    this.name,
    this.owner,
    this.description,
    this.private,
    this.public,
    this.internal,
    this.fork,
    this.htmlUrl,
    this.sshUrl,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.hooksUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.commitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.recommend,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.watchersCount,
    this.defaultBranch,
    this.openIssuesCount,
    this.hasIssues,
    this.hasWiki,
    this.canComment,
    this.pullRequestsEnabled,
    this.hasPage,
    this.license,
    this.outsourced,
    this.projectCreator,
    this.members,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.stared,
    this.watched,
    this.permission,
    this.relation,
  );

  bool operator ==(other) {
    if (this.id == other.id) {
      return true;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;

  factory Repo.fromJson(Map<String, dynamic> srcJson) =>
      _$RepoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class Namespace extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  Namespace(
    this.id,
    this.type,
    this.name,
    this.path,
    this.htmlUrl,
  );

  factory Namespace.fromJson(Map<String, dynamic> srcJson) =>
      _$NamespaceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NamespaceToJson(this);
}

@JsonSerializable()
class Owner extends Object {
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

  Owner(
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
  );

  factory Owner.fromJson(Map<String, dynamic> srcJson) =>
      _$OwnerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

@JsonSerializable()
class Permission extends Object {
  @JsonKey(name: 'pull')
  bool pull;

  @JsonKey(name: 'push')
  bool push;

  @JsonKey(name: 'admin')
  bool admin;

  Permission(
    this.pull,
    this.push,
    this.admin,
  );

  factory Permission.fromJson(Map<String, dynamic> srcJson) =>
      _$PermissionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
