import 'package:flutter_gitreader/model/user.dart';
import 'package:json_annotation/json_annotation.dart'; 
  
part 'profile.g.dart';

@JsonSerializable()
  class Profile{
    User user;
    String token;
    String theme;
    
    Profile();

    factory Profile.fromJson(Map<String, dynamic> srcJson) => _$ProfileFromJson(srcJson);

    Map<String, dynamic> toJson() => _$ProfileToJson(this);
  }