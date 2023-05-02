class PostModel {
  final String postId;
  final String userId;
  final String imageUrl;
  final String caption;
  final String username; // Added user name property
  final String userImage; // Added user image property

  PostModel({
    required this.postId,
    required this.userId,
    required this.imageUrl,
    required this.caption,
    required this.username,
    required this.userImage,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['postId'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      username: json['username'], // Added user name property
      userImage: json['userImage'], // Added user image property
    );
  }
}
