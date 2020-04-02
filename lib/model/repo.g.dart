// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(
    json['id'] as int,
    json['is_fvorites'] as bool,
    json['full_name'] as String,
    json['human_name'] as String,
    json['url'] as String,
    json['namespace'] == null
        ? null
        : Namespace.fromJson(json['namespace'] as Map<String, dynamic>),
    json['path'] as String,
    json['name'] as String,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['description'] as String,
    json['private'] as bool,
    json['public'] as bool,
    json['internal'] as bool,
    json['fork'] as bool,
    json['html_url'] as String,
    json['ssh_url'] as String,
    json['forks_url'] as String,
    json['keys_url'] as String,
    json['collaborators_url'] as String,
    json['hooks_url'] as String,
    json['branches_url'] as String,
    json['tags_url'] as String,
    json['blobs_url'] as String,
    json['stargazers_url'] as String,
    json['contributors_url'] as String,
    json['commits_url'] as String,
    json['comments_url'] as String,
    json['issue_comment_url'] as String,
    json['issues_url'] as String,
    json['pulls_url'] as String,
    json['milestones_url'] as String,
    json['notifications_url'] as String,
    json['labels_url'] as String,
    json['releases_url'] as String,
    json['recommend'] as bool,
    json['language'] as String,
    json['forks_count'] as int,
    json['stargazers_count'] as int,
    json['watchers_count'] as int,
    json['default_branch'] as String,
    json['open_issues_count'] as int,
    json['has_issues'] as bool,
    json['has_wiki'] as bool,
    json['can_comment'] as bool,
    json['pull_requests_enabled'] as bool,
    json['has_page'] as bool,
    json['license'] as String,
    json['outsourced'] as bool,
    json['project_creator'] as String,
    (json['members'] as List)?.map((e) => e as String)?.toList(),
    json['pushed_at'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['stared'] as bool,
    json['watched'] as bool,
    json['permission'] == null
        ? null
        : Permission.fromJson(json['permission'] as Map<String, dynamic>),
    json['relation'] as String,
  );
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'is_fvorites': instance.isFavorite,
      'full_name': instance.fullName,
      'human_name': instance.humanName,
      'url': instance.url,
      'namespace': instance.namespace,
      'path': instance.path,
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'private': instance.private,
      'public': instance.public,
      'internal': instance.internal,
      'fork': instance.fork,
      'html_url': instance.htmlUrl,
      'ssh_url': instance.sshUrl,
      'forks_url': instance.forksUrl,
      'keys_url': instance.keysUrl,
      'collaborators_url': instance.collaboratorsUrl,
      'hooks_url': instance.hooksUrl,
      'branches_url': instance.branchesUrl,
      'tags_url': instance.tagsUrl,
      'blobs_url': instance.blobsUrl,
      'stargazers_url': instance.stargazersUrl,
      'contributors_url': instance.contributorsUrl,
      'commits_url': instance.commitsUrl,
      'comments_url': instance.commentsUrl,
      'issue_comment_url': instance.issueCommentUrl,
      'issues_url': instance.issuesUrl,
      'pulls_url': instance.pullsUrl,
      'milestones_url': instance.milestonesUrl,
      'notifications_url': instance.notificationsUrl,
      'labels_url': instance.labelsUrl,
      'releases_url': instance.releasesUrl,
      'recommend': instance.recommend,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'has_issues': instance.hasIssues,
      'has_wiki': instance.hasWiki,
      'can_comment': instance.canComment,
      'pull_requests_enabled': instance.pullRequestsEnabled,
      'has_page': instance.hasPage,
      'license': instance.license,
      'outsourced': instance.outsourced,
      'project_creator': instance.projectCreator,
      'members': instance.members,
      'pushed_at': instance.pushedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stared': instance.stared,
      'watched': instance.watched,
      'permission': instance.permission,
      'relation': instance.relation,
    };

Namespace _$NamespaceFromJson(Map<String, dynamic> json) {
  return Namespace(
    json['id'] as int,
    json['type'] as String,
    json['name'] as String,
    json['path'] as String,
    json['html_url'] as String,
  );
}

Map<String, dynamic> _$NamespaceToJson(Namespace instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'html_url': instance.htmlUrl,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['id'] as int,
    json['login'] as String,
    json['name'] as String,
    json['avatar_url'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['gists_url'] as String,
    json['starred_url'] as String,
    json['subscriptions_url'] as String,
    json['organizations_url'] as String,
    json['repos_url'] as String,
    json['events_url'] as String,
    json['received_events_url'] as String,
    json['type'] as String,
    json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    json['pull'] as bool,
    json['push'] as bool,
    json['admin'] as bool,
  );
}

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'pull': instance.pull,
      'push': instance.push,
      'admin': instance.admin,
    };
