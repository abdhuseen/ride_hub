enum ReviewStatus {
  pending,
  approved,
  rejected,
}

class Review {
  final String carId;
  final String userId;
  final int stars; // تقييم من 1 إلى 5
  final String reviewTitle;
  final String reviewDescription;
  final ReviewStatus reviewStatus;
  final DateTime date;

  Review({
    required this.carId,
    required this.userId,
    required this.stars,
    required this.reviewTitle,
    required this.reviewDescription,
    required this.reviewStatus,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      carId: json['carId'],
      userId: json['userId'],
      stars: json['stars'],
      reviewTitle: json['reviewTitle'],
      reviewDescription: json['reviewDescription'],
      reviewStatus: _parseReviewStatus(json['reviewStatus']),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'userId': userId,
      'stars': stars,
      'reviewTitle': reviewTitle,
      'reviewDescription': reviewDescription,
      'reviewStatus': reviewStatus.name,
      'date': date.toIso8601String(),
    };
  }

  static ReviewStatus _parseReviewStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return ReviewStatus.pending;
      case 'approved':
        return ReviewStatus.approved;
      case 'rejected':
        return ReviewStatus.rejected;
      default:
        return ReviewStatus.pending;
    }
  }
}